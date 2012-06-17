From: Martin Steigerwald <Martin@lichtvoll.de>
Subject: Re: Partitions: Amiga RDB partition on 2 TB disk way too big, while OK in AmigaOS 4.1
Date: Sun, 17 Jun 2012 10:33:51 +0200
Message-ID: <201206171033.51625.Martin@lichtvoll.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mondschein.lichtvoll.de ([194.150.191.11]:42970 "EHLO
	mail.lichtvoll.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752955Ab2FQIdx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 17 Jun 2012 04:33:53 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-m68k@vger.kernel.org, Jens Axboe <axboe@kernel.dk>

Sorry, forgot to keep Cc.

I think I will keep the disk as is for a while. I just won=C2=B4t plug =
it to
the Amiga, since I have my Amiga backup on another dedicated
disk and do not want to overwrite my Linux backups. So its available
for testing for a while. It should be save as long as I use the disk
in Linux only.

=46or safety I will recreate all backups. I can checksum the BTRFS base=
d
backup partition for checksum errors, but fscking the other non
BTRFS ones will only give a vague hint.


Am Sonntag, 17. Juni 2012 schrieb Martin Steigerwald:
> Hi Jens, hi Linux m68k developers,
>=20
> I reported that as
>=20
> https://bugzilla.kernel.org/show_bug.cgi?id=3D43511
>=20
> I will attach there some more debug data like binary copy of RDB and
> such.
>=20
> But maybe its easier to discuss here.

I think this one is pretty serious:

merkaba:~> pvdisplay /dev/sdb1
  --- Physical volume ---
  PV Name               /dev/sdb1
  VG Name               steigerwald
  PV Size               1,82 TiB / not usable 4,08 MiB
  Allocatable           yes=20
  PE Size               4,00 MiB
  Total PE              476931
  Free PE               105731
  Allocated PE          371200
  PV UUID               ZXMECC-JAir-lX8Q-rLhS-W1cS-quwz-b3FXWp
  =20
merkaba:~> vgdisplay steigerwald
  --- Volume group ---
  VG Name               steigerwald
  System ID            =20
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  7
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                5
  Open LV               1
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               1,82 TiB
  PE Size               4,00 MiB
  Total PE              476931
  Alloc PE / Size       371200 / 1,42 TiB
  Free  PE / Size       105731 / 413,01 GiB
  VG UUID               uhjjE1-0yrD-Ch1A-d9qL-P5jY-UDXE-io4bpi


with

merkaba:~#1> amiga-fdisk -l /dev/sdc
Disk /dev/sdc: 3 heads, 16 sectors, 81396441 cylinders, RDB: 0
Logical Cylinders from 43 to 81396440, 24576  bytes/Cylinder=20

Device     Boot Mount   Begin      End     Size   Pri  BBlks    System
/dev/sdc1       *        43   65536043   1572864024     0      0  Linux=
=20
native
/dev/sdc2       *    65536044   78643244   314572824     0      0 =20
[unknown]
/dev/sdc3       *    78643245   81396440   66076704     0      0  Amiga=
=20
=46FS Int.


Due to truncating oversized partition instead of refusing to use
them the PV and consequently VG span the whole disk instead
of leaving space for the >350GB in the two other partitions:

merkaba:~> cat /proc/partitions=20
major minor  #blocks  name

 [=E2=80=A6]
   8       16 1953514584 sdb
   8       17 1953513552 sdb1

(now sdb instead of sdc back when I run amiga-fdisk)


This is just asking for trouble. Thus:

Bug 43521 - Amiga RDB partitions: truncates miscaluted partitions size=20
instead of refusing to use it
https://bugzilla.kernel.org/show_bug.cgi?id=3D43521


My suggestion is to bail out if a partition size looks insane and=20
impossible.
Having to manually fix it up to access the data on disk still looks bet=
ter
to me than potentially overwriting lots of data.



Until today I never actually did an Amiga backup to the disk, I just
created the two Amiga partitions and copied some screenshots of them
but that might be enough to explain the checksum errors I found in a
BTRFS backup partition.

I am now checking my Linux backups. They might be save, cause not all
space on the volume group is used.

See:

kernel got struck while scrubbing BTRFS with node- and leafsize 32768
http://www.mail-archive.com/linux-btrfs@vger.kernel.org/msg17108.html

s/struck/stuck

Thanks,
--=20
Martin 'Helios' Steigerwald - http://www.Lichtvoll.de
GPG: 03B0 0D6C 0040 0710 4AFA  B82F 991B EAAC A599 84C7
