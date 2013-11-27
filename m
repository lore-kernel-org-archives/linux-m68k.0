From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Evolution of Linux kernel sizes
Date: Wed, 27 Nov 2013 10:38:33 +0100
Message-ID: <CAMuHMdUzyqVqeWx4-aaLpV-MOsqTSA4yihEdmzXhGiuaz=ZWXg@mail.gmail.com>
References: <CAMuHMdUr2Vr9+STwcYf1PcB=PF+u3SJxU3LYnzqQ+vdbDsp71A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:48429 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751106Ab3K0Jie (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 27 Nov 2013 04:38:34 -0500
Received: by mail-pd0-f176.google.com with SMTP id w10so9528854pde.21
        for <linux-m68k@vger.kernel.org>; Wed, 27 Nov 2013 01:38:33 -0800 (PST)
In-Reply-To: <CAMuHMdUr2Vr9+STwcYf1PcB=PF+u3SJxU3LYnzqQ+vdbDsp71A@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>

[Keeping only linux-m68k for discussions about m68k/multi_defconfig]

On Wed, Nov 27, 2013 at 10:35 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> 4010686  220476  190220 4421382  437706 vmlinux-v3.12

So I want to save ca. 250 KiB.

> For v3.13-rc1, the top 10 is:

And here's the full list:

Disabling CONFIG_NET saves 1038404 bytes
Disabling CONFIG_INET saves 572034 bytes
Disabling CONFIG_EXT4_FS saves 328370 bytes
Disabling CONFIG_NFS_FS saves 258728 bytes
Disabling CONFIG_NETWORK_FILESYSTEMS saves 258728 bytes
Disabling CONFIG_SCSI saves 241850 bytes
Disabling CONFIG_FB saves 207496 bytes
Disabling CONFIG_AMIGA saves 160700 bytes
Disabling CONFIG_MAC saves 151134 bytes
Disabling CONFIG_ATARI saves 138392 bytes
Disabling CONFIG_NETDEVICES saves 118758 bytes
Disabling CONFIG_ETHERNET saves 118342 bytes
Disabling CONFIG_EXT3_FS saves 116310 bytes
Disabling CONFIG_SCSI_LOWLEVEL saves 98200 bytes
Disabling CONFIG_IDE saves 90042 bytes
Disabling CONFIG_NET_KEY saves 74866 bytes
Disabling CONFIG_ZORRO saves 65064 bytes
Disabling CONFIG_M68060 saves 59602 bytes
Disabling CONFIG_NET_VENDOR_NATSEMI saves 57472 bytes
Disabling CONFIG_BLK_DEV saves 52814 bytes
Disabling CONFIG_NET_VENDOR_8390 saves 47990 bytes
Disabling CONFIG_FRAMEBUFFER_CONSOLE saves 44854 bytes
Disabling CONFIG_M68040 saves 41022 bytes
Disabling CONFIG_HP300 saves 38554 bytes
Disabling CONFIG_KEYS saves 35768 bytes
Disabling CONFIG_EXT2_FS saves 35052 bytes
Disabling CONFIG_SCSI_CONSTANTS saves 34304 bytes
Disabling CONFIG_MACINTOSH_DRIVERS saves 31806 bytes
Disabling CONFIG_ADB saves 30814 bytes
Disabling CONFIG_QUOTA saves 28428 bytes
Disabling CONFIG_FB_ATARI saves 26680 bytes
Disabling CONFIG_SERIAL_PMACZILOG saves 25040 bytes
Disabling CONFIG_VME saves 24966 bytes
Disabling CONFIG_FB_ATY saves 23618 bytes
Disabling CONFIG_LOGO saves 22680 bytes
Disabling CONFIG_NET_VENDOR_AMD saves 21814 bytes
Disabling CONFIG_SWAP saves 21414 bytes
Disabling CONFIG_BLK_DEV_SD saves 20440 bytes
Disabling CONFIG_NFS_V3 saves 20318 bytes
Disabling CONFIG_M68KFPU_EMU saves 20130 bytes
Disabling CONFIG_PACKET saves 18694 bytes
Disabling CONFIG_BLK_DEV_INITRD saves 18480 bytes
Disabling CONFIG_ISO9660_FS saves 18174 bytes
Disabling CONFIG_SYSVIPC saves 16652 bytes
Disabling CONFIG_IDE_GD saves 16496 bytes
Disabling CONFIG_ZORRO_NAMES saves 16384 bytes
Disabling CONFIG_BLK_DEV_IDECD saves 16338 bytes
Disabling CONFIG_AMIGA_FLOPPY saves 16118 bytes
Disabling CONFIG_FB_AMIGA saves 16116 bytes
Disabling CONFIG_Q40 saves 15774 bytes
Disabling CONFIG_ATARI_SCSI saves 15560 bytes
Disabling CONFIG_ATARI_FLOPPY saves 15182 bytes
Disabling CONFIG_KEXEC saves 14750 bytes
Disabling CONFIG_INPUT_KEYBOARD saves 14376 bytes
Disabling CONFIG_NET_VENDOR_INTEL saves 13958 bytes
Disabling CONFIG_NET_VENDOR_I825XX saves 13958 bytes
Disabling CONFIG_AMIGA_PCMCIA saves 13648 bytes
Disabling CONFIG_IP_PNP saves 12930 bytes
Disabling CONFIG_MAC_SCSI saves 12336 bytes
Disabling CONFIG_UNIX saves 12024 bytes
Disabling CONFIG_ATARI_ETHERNAT saves 11872 bytes
Disabling CONFIG_RTC_CLASS saves 11854 bytes
Disabling CONFIG_SMC91X saves 11326 bytes
Disabling CONFIG_NET_VENDOR_SMSC saves 11326 bytes
Disabling CONFIG_IOSCHED_CFQ saves 11006 bytes
Disabling CONFIG_CRYPTO_MANAGER saves 10512 bytes
Disabling CONFIG_LBDAF saves 10128 bytes
Disabling CONFIG_BLK_DEV_SR saves 9558 bytes
Disabling CONFIG_BLK_DEV_LOOP saves 9558 bytes
Disabling CONFIG_MACSONIC saves 9510 bytes
Disabling CONFIG_IDE_PROC_FS saves 9462 bytes
Disabling CONFIG_FB_CIRRUS saves 9392 bytes
Disabling CONFIG_BINFMT_ELF saves 9018 bytes
Disabling CONFIG_DIO saves 8902 bytes
Disabling CONFIG_SUN3X saves 8464 bytes
Disabling CONFIG_LOGO_MAC_CLUT224 saves 8208 bytes
Disabling CONFIG_LOGO_LINUX_CLUT224 saves 8192 bytes
Disabling CONFIG_MVME16x saves 7704 bytes
Disabling CONFIG_ATARILANCE saves 7504 bytes
Disabling CONFIG_APNE saves 7318 bytes
Disabling CONFIG_FB_MAC saves 6566 bytes
Disabling CONFIG_BLK_DEV_RAM saves 6462 bytes
Disabling CONFIG_NATFEAT saves 6152 bytes
Disabling CONFIG_MAC8390 saves 5496 bytes
Disabling CONFIG_FB_VALKYRIE saves 5360 bytes
Disabling CONFIG_KEYBOARD_HIL_OLD saves 5000 bytes
Disabling CONFIG_NETFILTER saves 4720 bytes
Disabling CONFIG_KEYBOARD_AMIGA saves 4414 bytes
Disabling CONFIG_BOOTINFO_PROC saves 4126 bytes
Disabling CONFIG_LOGO_LINUX_VGA16 saves 4112 bytes
Disabling CONFIG_ROOT_NFS saves 4094 bytes
Disabling CONFIG_INPUT_ADBHID saves 3830 bytes
Disabling CONFIG_MAGIC_SYSRQ saves 3760 bytes
Disabling CONFIG_A2065 saves 3736 bytes
Disabling CONFIG_INOTIFY_USER saves 3664 bytes
Disabling CONFIG_ARIADNE saves 3568 bytes
Disabling CONFIG_FHANDLE saves 3472 bytes
Disabling CONFIG_XFRM_MIGRATE saves 3464 bytes
Disabling CONFIG_NET_VENDOR_APPLE saves 3198 bytes
Disabling CONFIG_MACMACE saves 3198 bytes
Disabling CONFIG_SUN3LANCE saves 3158 bytes
Disabling CONFIG_POSIX_MQUEUE saves 3156 bytes
Disabling CONFIG_BSD_PROCESS_ACCT saves 3096 bytes
Disabling CONFIG_TMPFS saves 3054 bytes
Disabling CONFIG_NFS_V2 saves 2998 bytes
Disabling CONFIG_SCSI_MAC_ESP saves 2974 bytes
Disabling CONFIG_ZISOFS saves 2968 bytes
Disabling CONFIG_APOLLO saves 2856 bytes
Disabling CONFIG_AMIGA_BUILTIN_SERIAL saves 2854 bytes
Disabling CONFIG_SCSI_PROC_FS saves 2720 bytes
Disabling CONFIG_ADB_CUDA saves 2696 bytes
Disabling CONFIG_PROC_KCORE saves 2678 bytes
Disabling CONFIG_KEYBOARD_ATARI saves 2550 bytes
Disabling CONFIG_ADB_MACII saves 2528 bytes
Disabling CONFIG_CLEANCACHE saves 2454 bytes
Disabling CONFIG_SYN_COOKIES saves 2408 bytes
Disabling CONFIG_IDE_GD_ATA saves 2304 bytes
Disabling CONFIG_KEYBOARD_SUNKBD saves 2222 bytes
Disabling CONFIG_RTC_INTF_DEV saves 1998 bytes
Disabling CONFIG_DEVTMPFS saves 1982 bytes
Disabling CONFIG_DNS_RESOLVER saves 1942 bytes
Disabling CONFIG_ATARI_PARTITION saves 1904 bytes
Disabling CONFIG_ZORRO8390 saves 1824 bytes
Disabling CONFIG_NET_VENDOR_CIRRUS saves 1814 bytes
Disabling CONFIG_MAC89x0 saves 1814 bytes
Disabling CONFIG_BOUNCE saves 1752 bytes
Disabling CONFIG_GVP11_SCSI saves 1744 bytes
Disabling CONFIG_SERIAL_PMACZILOG_CONSOLE saves 1504 bytes
Disabling CONFIG_CROSS_MEMORY_ATTACH saves 1432 bytes
Disabling CONFIG_AMIGA_Z2RAM saves 1422 bytes
Disabling CONFIG_JOLIET saves 1376 bytes
Disabling CONFIG_FB_ATY_BACKLIGHT saves 1374 bytes
Disabling CONFIG_SUN3X_ESP saves 1262 bytes
Disabling CONFIG_DNOTIFY saves 1256 bytes
Disabling CONFIG_A2091_SCSI saves 1232 bytes
Disabling CONFIG_FB_FM2 saves 1190 bytes
Disabling CONFIG_HYDRA saves 1160 bytes
Disabling CONFIG_RTC_INTF_SYSFS saves 1080 bytes
Disabling CONFIG_AMIGA_PARTITION saves 1080 bytes
Disabling CONFIG_SCSI_ZORRO7XX saves 1048 bytes
Disabling CONFIG_XZ_DEC_IA64 saves 1040 bytes
Disabling CONFIG_FB_AMIGA_AGA saves 1040 bytes
Disabling CONFIG_SERIO_SERPORT saves 1026 bytes
Disabling CONFIG_MAC_EMUMOUSEBTN saves 1024 bytes
Disabling CONFIG_RTC_INTF_PROC saves 976 bytes
Disabling CONFIG_INPUT_MOUSEDEV saves 946 bytes
Disabling CONFIG_HPLANCE saves 944 bytes
Disabling CONFIG_BLK_DEV_SR_VENDOR saves 888 bytes
Disabling CONFIG_ADB_PMU68K saves 880 bytes
Disabling CONFIG_ADB_IOP saves 880 bytes
Disabling CONFIG_BLK_DEV_BSGLIB saves 864 bytes
Disabling CONFIG_MVME147 saves 822 bytes
Disabling CONFIG_A3000_SCSI saves 782 bytes
Disabling CONFIG_BSD_DISKLABEL saves 768 bytes
Disabling CONFIG_MVME16x_NET saves 760 bytes
Disabling CONFIG_BVME6000_NET saves 758 bytes
Disabling CONFIG_MSDOS_PARTITION saves 752 bytes
Disabling CONFIG_MVME16x_SCSI saves 734 bytes
Disabling CONFIG_MVME147_SCSI saves 734 bytes
Disabling CONFIG_QUOTA_NETLINK_INTERFACE saves 672 bytes
Disabling CONFIG_SOLARIS_X86_PARTITION saves 640 bytes
Disabling CONFIG_NFETH saves 632 bytes
Disabling CONFIG_BVME6000_SCSI saves 622 bytes
Disabling CONFIG_MAC_PARTITION saves 584 bytes
Disabling CONFIG_SERIO_Q40KBD saves 582 bytes
Disabling CONFIG_BLK_DEV_FALCON_IDE saves 568 bytes
Disabling CONFIG_SUN_PARTITION saves 544 bytes
Disabling CONFIG_FB_AMIGA_OCS saves 544 bytes
Disabling CONFIG_ATARI_ETHERNEC saves 542 bytes
Disabling CONFIG_RTC_SYSTOHC saves 536 bytes
Disabling CONFIG_SYSV68_PARTITION saves 528 bytes
Disabling CONFIG_NFCON saves 486 bytes
Disabling CONFIG_NFBLOCK saves 480 bytes
Disabling CONFIG_HEARTBEAT saves 478 bytes
Disabling CONFIG_BINFMT_SCRIPT saves 432 bytes
Disabling CONFIG_BLK_DEV_Q40IDE saves 430 bytes
Disabling CONFIG_XZ_DEC_X86 saves 392 bytes
Disabling CONFIG_MINIX_SUBPARTITION saves 384 bytes
Disabling CONFIG_FB_AMIGA_ECS saves 368 bytes
Disabling CONFIG_EARLY_PRINTK saves 360 bytes
Disabling CONFIG_NFS_SWAP saves 312 bytes
Disabling CONFIG_UNIXWARE_DISKLABEL saves 304 bytes
Disabling CONFIG_KEYBOARD_HIL saves 262 bytes
Disabling CONFIG_SCSI_A4000T saves 256 bytes
Disabling CONFIG_SERIAL_CONSOLE saves 230 bytes
Disabling CONFIG_PROC_HARDWARE saves 224 bytes
Disabling CONFIG_XZ_DEC_ARMTHUMB saves 208 bytes
Disabling CONFIG_IDE_GD_ATAPI saves 184 bytes
Disabling CONFIG_BLK_DEV_GAYLE saves 152 bytes
Disabling CONFIG_NLS_ISO8859_1 saves 128 bytes
Disabling CONFIG_NLS_CODEPAGE_437 saves 128 bytes
Disabling CONFIG_CRC_T10DIF saves 118 bytes
Disabling CONFIG_XZ_DEC_SPARC saves 112 bytes
Disabling CONFIG_INPUT_MOUSEDEV_PSAUX saves 94 bytes
Disabling CONFIG_XZ_DEC_ARM saves 88 bytes
Disabling CONFIG_XZ_DEC_POWERPC saves 72 bytes
Disabling CONFIG_BLK_DEV_MAC_IDE saves 64 bytes
Disabling CONFIG_COMPAT_BRK saves 32 bytes
Disabling CONFIG_BLK_DEV_BUDDHA saves 30 bytes
Disabling CONFIG_M68020 saves 24 bytes
Disabling CONFIG_LOGO_LINUX_MONO saves 8 bytes
Disabling CONFIG_STANDALONE saves 0 bytes
Disabling CONFIG_SERIAL_PMACZILOG_TTYS saves 0 bytes
Disabling CONFIG_RTC_HCTOSYS saves 0 bytes
Disabling CONFIG_PREVENT_FIRMWARE_BUILD saves 0 bytes
Disabling CONFIG_NETFILTER_ADVANCED saves 0 bytes
Disabling CONFIG_NET_CORE saves 0 bytes
Disabling CONFIG_MISC_FILESYSTEMS saves 0 bytes
Disabling CONFIG_MD saves 0 bytes
Disabling CONFIG_LOCALVERSION_AUTO saves 0 bytes
Disabling CONFIG_IP_PNP_RARP saves 0 bytes
Disabling CONFIG_INPUT_MOUSE saves 0 bytes
Disabling CONFIG_INPUT_MISC saves 0 bytes
Disabling CONFIG_INPUT_JOYSTICK saves 0 bytes
Disabling CONFIG_ENABLE_WARN_DEPRECATED saves 0 bytes
Disabling CONFIG_ENABLE_MUST_CHECK saves 0 bytes
Disabling CONFIG_IP_PNP_DHCP saves -2 bytes
Disabling CONFIG_IP_PNP_BOOTP saves -2 bytes
Disabling CONFIG_BVME6000 saves -32 bytes
Disabling CONFIG_BSD_PROCESS_ACCT_V3 saves -64 bytes
Disabling CONFIG_FANOTIFY saves -298 bytes
Disabling CONFIG_MVME147_NET saves -4592 bytes
Disabling CONFIG_PARTITION_ADVANCED saves -6058 bytes
Disabling CONFIG_SLAB saves -9282 bytes
Disabling CONFIG_ATARI_ROM_ISA saves -20616 bytes
Disabling CONFIG_CRYPTO_MANAGER_DISABLE_TESTS saves -136576 bytes

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
