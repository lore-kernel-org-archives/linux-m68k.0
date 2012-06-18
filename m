From: jdow <jdow@earthlink.net>
Subject: Re: Partitions: Amiga RDB partition on 2 TB disk way too big, while
 OK in AmigaOS 4.1
Date: Mon, 18 Jun 2012 13:58:11 -0700
Message-ID: <4FDF9663.4050408@earthlink.net>
References: <201206170841.20222.Martin@lichtvoll.de> <201206171458.58462.Martin@lichtvoll.de> <CAMuHMdWY7=2nJDUjQFGPhdOAFGYeUsnvgPcaEvB2Gxf7P=E+Ug@mail.gmail.com> (sfid-20120617_225443_752860_DC66624F) <201206182239.26647.Martin@lichtvoll.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from elasmtp-masked.atl.sa.earthlink.net ([209.86.89.68]:48108 "EHLO
	elasmtp-masked.atl.sa.earthlink.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752556Ab2FRU6T (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Mon, 18 Jun 2012 16:58:19 -0400
In-Reply-To: <201206182239.26647.Martin@lichtvoll.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Martin Steigerwald <Martin@lichtvoll.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, linux-m68k@vger.kernel.org

On 2012/06/18 13:39, Martin Steigerwald wrote:
> Am Sonntag, 17. Juni 2012 schrieb Geert Uytterhoeven:
>> On Sun, Jun 17, 2012 at 2:58 PM, Martin Steigerwald
>> <Martin@lichtvoll.de> wrote:
>>> Am Sonntag, 17. Juni 2012 schrieb jdow:
>>> | JXFS 64 bit file system
>>> |
>>> | With AmigaOS 4.x a new file system has been introduced called JXF=
S.
>>> | It is a totally new 64 bit file system that supports partitions u=
p
>>> | to 16 TB in size. It is a modern journalling file system, which
>>> | means that it reduces data loss if data writes to the disk are
>>> | interrupted. It is the fastest and most reliable file system ever
>>> | created for AmigaOS.
>>>
>>> http://www.amigaos.net/content/1/features
>>>
>>> Well I asked AmigaOS 4 developers about this issue as well. Lets se=
e
>>> what they say about 2 TB limits.
>>
>> 16 TB =3D 2 TB * 8. Perhaps they increased the block size from 512 t=
o
>> 4096?
>>
>> block/partitions/amiga.c reads the block size from
>> RigidDiskBlock.rdb_BlockBytes,
>> but after conversion to 512-byte blocks, all further calculations ar=
e
>> done on "int", so it will overflow for disks larger than 2 TiB.
>
> Meanwhile I got a response from a AmigaOS 4 developer.
>
> I documented the stuff as I understood it in the AmigaOS wiki:
>
> | Disk size
> |
> | The RDB has a quite high limit on the maximum device size, but note=
 that
> | currently each filesystem interprets the partition layout by itself=
=2E
>
> | The raw, theoretical limit on the maximum device capacity is about =
2^105
> | bytes:
> |
> | 32 bit rdb_Cylinders * 32 bit rdb_Heads * 32 bit rdb_Sectors * 512
> | bytes/sector for the HD size in struct RigidDiskBlock
> |
> | It's even much more if the sector size (rdb_BlockBytes and de_SizeB=
lock)
> | is larger than 512 bytes, but AmigaOS 4.1 doesn't support anything =
but
> | 512 bytes/sector HDs yet.
> |
> | Partition size
> |
> | For the partitions the maximum size is:
> | 32 bit (de_HighCyl + 1 - de_LowCyl) (to get the partition size) * 3=
2 bit
> | de_Surfaces * 32 bit de_SectorsPerTrack * 512 bytes/sector in struc=
t
> | DosEnvec (=3Dpb_Environment[]) in struct PartitionBlock.
> |
> | That's from the physical drive part, the actual disk size limit for=
 the
> | partitions may be much smaller depending on the partitioning softwa=
re,
> | if it's only using the logical sizes instead, which is likely the c=
ase,
> | it's only 8 ZiB with 512 bytes/sector: 32 bit rdb_HiCylinder * 32 b=
it
> | rdb_CylBlocks * 512 bytes/sector =3D 2^73 bytes. For using the logi=
cal
> | sizes using simple uint64 calculations (with some overflow checks) =
should
> | be enough, for more a math library with support for larger integers
> | needs to be used which probably no partitioning software does.
> |
> | But note: Nothing in struct RigiDiskBlock is used by the file syste=
ms for
> | mounting the partitions, they only get the information from the str=
uct
> | PartitionBlock blocks, it's only a problem for the partitioning sof=
tware
> | creating the partitions correctly - as soon as there are HDs larger=
 than
> | 8 ZB while still using 512 bytes/sector if that ever happens.
>
> http://wiki.amigaos.net/index.php/RDB

He's in the right ballpark but he missed something in the RDISK block:
     __u32   rdb_LoCylinder;	// 88	0x2b		Ayup - checks
     __u32   rdb_HiCylinder;	// 8C   0x04da02d8	Whole disk used.
     __u32   rdb_CylBlocks;	// 90	0x30		checks

So he has two 32 bit unsigned integers not three to multiply together.
If he ignores that detail he can, indeed, go out to three ULONGS for th=
e
total disk logical block count. Then he has two more ULONGs for physica=
l
block size and number of physical blocks per filesystem blocks. So the
size could, in theory, go past 2^100 bytes.

The filesystem is still likely limited to 2 TB or so unless there is a
64 bit version now.

> Please note that the documentation there might be updated or correcte=
d in
> the future. But thats the current state.
>
>> Note that in your profile-binary.img, the field is 0x200, i.e. 512
>> bytes per block,
>> so I'll have to get a deeper look into your RDB first...
>
> I am a bit overwhelmed by Joanne=B4s analysis. I didn=B4t yet take ti=
me to
> completely read and try to understand it. I first wanted to get this
> information out.

When you can please recompile a kernel with that one change to it. It
MIGHT turn the trick. It changes an int to a sector_t (unsigned long lo=
ng)
so the math does not go funkity going into the "put_partition" function=
,
which has disk blocks as sector_t values. (I think, but can't be sure,
that the put_partition call used int when I "committed" that sin way ba=
ck
when. I've not yet compared that code with the code I submitted many ye=
ars
ago to see if all the right stuff is still there.)

{^_^}
