# NixOS config

## Installation 

Following the [documentation](https://nixos.org/manual/nixos/stable/index.html#sec-installation)

- Step 1: Disk partitionnement
  ```bash
  # Partition table
  parted /dev/nvme0n1 -- mklabel gpt

  # Boot partition
  parted /dev/nvme0n1 -- mkpart ESP fat32 1MB 512MB
  parted /dev/nvme0n1 -- set 3 esp on

  # Root partition, 
  # Replace <RAM_SIZE> with the size of the machine's RAM
  parted /dev/nvme0n1 -- mkpart primary 512MB -<RAM_SIZE>GB
  
  # Swap partition
  # Replace <RAM_SIZE> with the size of the machine's RAM
  parted /dev/nvme0n1 -- mkpart primary linux-swap -<RAM_SIZE>GB 100%
  ```

- Step 3: Disk encryption
  ```bash
  # Encrypt and open partition 
  cryptsetup luksFormat /dev/nvme0n1p2
  cryptsetup luksOpen /dev/nvme0n1p2 cryptroot
  ```

- Step 2: Formatting
  ```bash
  mkfs.fat -F 32 -n boot /dev/nvme0n1p1
  mkfs.ext4 -L nixos /dev/mapper/cryptroot
  mkswap -L swap /dev/nvme0n1p3
  ```

- Step 3: Mount partition
  ```bash
  # Mount root partition to /mnt
  mount /dev/disk/by-label/nixos /mnt

  # Mount boot fs on /mnt/boot
  mkdir -p /mnt/boot
  mount /dev/disk/by-label/boot /mnt/boot

  #Enable swap
  swapon /dev/nvme0n1p3
  ```

- Step 4: Clone configuration
  ```bash
  # Git
  nix-env -iA nixos.git

  # Clone this repositry into /etc/nixos
  mkdir -p /mnt/etc/nixos
  cd /mnt/etc/nixos
  git clone https://github.com/BriceMichalski/nixos .

  # Chose the host to install
  ./setup.sh heisenberg
  # Update hardware-configuration.nix
  nixos-generate-config --root /mnt --dir machines/local
  ```

- Step 5: Install Nixos
  ```bash
  nix-channel --add https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz home-manager
  nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
  nix-channel --add https://nixos.org/channels/nixos-22.05 nixos

  nix-channel --update

  nixos-install --no-root-passwd
  reboot
  ```
