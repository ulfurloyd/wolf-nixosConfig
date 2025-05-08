{ config, pkgs, ... }:
{
  # enable dconf
  programs.dconf.enable = true;

  # add user to libvirtd group
  users.users.wolf.extraGroups = [ "libvirtd" "kvm" ];

  # install necessary packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    quickemu
    spice spice-gtk
    spice-protocol
    win-virtio
    win-spice
    adwaita-icon-theme
    qemu_full
  ];

  # manage virtualization services
  virtualisation = {
    libvirtd = {
      enable = true;

      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };

    spiceUSBRedirection.enable = true;

    vmware.host.enable = true;
  };

  services.spice-vdagentd.enable = true;
}
