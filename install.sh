RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


# GET VAR
clear
echo -ne "What is this station name..? ";read name;
echo -ne "What is this station ram size..? ";read ram_size;
echo -ne "What is this station luks password..? ";read luks_password;
echo ""
echo "CONFIRMATION"
echo "============"
echo -e "Hostname: ${GREEN}$name${NC}"
echo -e "Ram size: ${GREEN}$ram_size${NC}"
echo -e "Luks password: ${GREEN}$luks_password${NC}"
echo ""
echo -n "Confirm..?[Y/N]";read confirm;

if [ "$confirm" != "Y" ]; then
    echo -e "${RED}ABORT${NC}"
    exit 1
else
    continue
fi

# Disk partitionnement
echo -e "${GREEN}Create partition on disk${NC}"
sleep 5
parted /dev/nvme0n1 -- mklabel gpt
parted /dev/nvme0n1 -- mkpart ESP fat32 1MB 512MB
parted /dev/nvme0n1 -- set 1 esp on
parted /dev/nvme0n1 -- mkpart primary 512MB -${ram_size}GB
parted /dev/nvme0n1 -- mkpart primary linux-swap -${ram_size}GB 100%

# Disk encryption
echo -e "${GREEN}Disk Encryption${NC}"
sleep 5
echo $luks_password | cryptsetup luksFormat /dev/nvme0n1p2
echo $luks_password | cryptsetup luksOpen /dev/nvme0n1p2 cryptroot

# Formatting
echo -e "${GREEN}Format partition${NC}"
sleep 5
mkfs.fat -F 32 -n boot /dev/nvme0n1p1
mkfs.ext4 -L nixos /dev/mapper/cryptroot
mkswap -L swap /dev/nvme0n1p3

# Mount partition
echo -e "${GREEN}Mount partition${NC}"
sleep 5
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot
swapon /dev/nvme0n1p3

# Config
echo -e "${GREEN}Download nixos configuration${NC}"
sleep 5
nix-env -iA nixos.git
mkdir -p /mnt/etc/nixos
cd /mnt/etc/nixos
git clone https://github.com/BriceMichalski/nixos .

./setup.sh $name
nixos-generate-config --root /mnt --dir machines/local

# Install
echo -e "${GREEN}Install nix channel${NC}"
sleep 5
nix-channel --add https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz home-manager
nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
nix-channel --add https://nixos.org/channels/nixos-22.05 nixos
nix-channel --update
echo -e "${GREEN}Nixos install${NC}"
nixos-install --no-root-passwd


# Reboot
echo -e "${GREEN}SLEEP 120 && REBOOT${NC}"
sleep 120
reboot
