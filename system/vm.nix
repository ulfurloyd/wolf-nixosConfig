{ config, pkgs, ... }:
{
  # enable dconf
  programs.dconf.enable = true;

  # add user to libvirtd group
  users.users.wolf.extraGroups = [ "libvirtd" ];

  virtualisation.vmware.host.enable = true;

  # install necessary packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    quickemu
    spice spice-gtk
    spice-protocol
    win-virtio
    win-spice
    gnome.adwaita-icon-theme
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
  };

  services.spice-vdagentd.enable = true;
}
