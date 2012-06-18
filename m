From: Martin Steigerwald <Martin@lichtvoll.de>
Subject: Re: Partitions: Amiga RDB partition on 2 TB disk way too big, while OK in AmigaOS 4.1
Date: Mon, 18 Jun 2012 22:39:26 +0200
Message-ID: <201206182239.26647.Martin@lichtvoll.de>
References: <201206170841.20222.Martin@lichtvoll.de> <201206171458.58462.Martin@lichtvoll.de> <CAMuHMdWY7=2nJDUjQFGPhdOAFGYeUsnvgPcaEvB2Gxf7P=E+Ug@mail.gmail.com> (sfid-20120617_225443_752860_DC66624F)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mondschein.lichtvoll.de ([194.150.191.11]:59227 "EHLO
	mail.lichtvoll.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753361Ab2FRUj2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 18 Jun 2012 16:39:28 -0400
In-Reply-To: <CAMuHMdWY7=2nJDUjQFGPhdOAFGYeUsnvgPcaEvB2Gxf7P=E+Ug@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: jdow <jdow@earthlink.net>, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, linux-m68k@vger.kernel.org

Am Sonntag, 17. Juni 2012 schrieb Geert Uytterhoeven:
> On Sun, Jun 17, 2012 at 2:58 PM, Martin Steigerwald=20
> <Martin@lichtvoll.de> wrote:
> > Am Sonntag, 17. Juni 2012 schrieb jdow:
> > | JXFS 64 bit file system
> > |=20
> > | With AmigaOS 4.x a new file system has been introduced called JXF=
S.
> > | It is a totally new 64 bit file system that supports partitions u=
p
> > | to 16 TB in size. It is a modern journalling file system, which
> > | means that it reduces data loss if data writes to the disk are
> > | interrupted. It is the fastest and most reliable file system ever
> > | created for AmigaOS.
> >=20
> > http://www.amigaos.net/content/1/features
> >=20
> > Well I asked AmigaOS 4 developers about this issue as well. Lets se=
e
> > what they say about 2 TB limits.
>=20
> 16 TB =3D 2 TB * 8. Perhaps they increased the block size from 512 to
> 4096?
>=20
> block/partitions/amiga.c reads the block size from
> RigidDiskBlock.rdb_BlockBytes,
> but after conversion to 512-byte blocks, all further calculations are
> done on "int", so it will overflow for disks larger than 2 TiB.

Meanwhile I got a response from a AmigaOS 4 developer.

I documented the stuff as I understood it in the AmigaOS wiki:

| Disk size
|
| The RDB has a quite high limit on the maximum device size, but note t=
hat=20
| currently each filesystem interprets the partition layout by itself.

| The raw, theoretical limit on the maximum device capacity is about 2^=
105=20
| bytes:
|
| 32 bit rdb_Cylinders * 32 bit rdb_Heads * 32 bit rdb_Sectors * 512=20
| bytes/sector for the HD size in struct RigidDiskBlock
|
| It's even much more if the sector size (rdb_BlockBytes and de_SizeBlo=
ck)=20
| is larger than 512 bytes, but AmigaOS 4.1 doesn't support anything bu=
t=20
| 512 bytes/sector HDs yet.
|
| Partition size
|
| For the partitions the maximum size is:
| 32 bit (de_HighCyl + 1 - de_LowCyl) (to get the partition size) * 32 =
bit=20
| de_Surfaces * 32 bit de_SectorsPerTrack * 512 bytes/sector in struct=20
| DosEnvec (=3Dpb_Environment[]) in struct PartitionBlock.
|
| That's from the physical drive part, the actual disk size limit for t=
he=20
| partitions may be much smaller depending on the partitioning software=
,=20
| if it's only using the logical sizes instead, which is likely the cas=
e,=20
| it's only 8 ZiB with 512 bytes/sector: 32 bit rdb_HiCylinder * 32 bit=
=20
| rdb_CylBlocks * 512 bytes/sector =3D 2^73 bytes. For using the logica=
l=20
| sizes using simple uint64 calculations (with some overflow checks) sh=
ould=20
| be enough, for more a math library with support for larger integers=20
| needs to be used which probably no partitioning software does.
|
| But note: Nothing in struct RigiDiskBlock is used by the file systems=
 for=20
| mounting the partitions, they only get the information from the struc=
t=20
| PartitionBlock blocks, it's only a problem for the partitioning softw=
are=20
| creating the partitions correctly - as soon as there are HDs larger t=
han=20
| 8 ZB while still using 512 bytes/sector if that ever happens.

http://wiki.amigaos.net/index.php/RDB

Please note that the documentation there might be updated or corrected =
in=20
the future. But thats the current state.

> Note that in your profile-binary.img, the field is 0x200, i.e. 512
> bytes per block,
> so I'll have to get a deeper look into your RDB first...

I am a bit overwhelmed by Joanne=C2=B4s analysis. I didn=C2=B4t yet tak=
e time to=20
completely read and try to understand it. I first wanted to get this=20
information out.

Thanks,
--=20
Martin 'Helios' Steigerwald - http://www.Lichtvoll.de
GPG: 03B0 0D6C 0040 0710 4AFA  B82F 991B EAAC A599 84C7
