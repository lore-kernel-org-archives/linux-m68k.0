From: jdow <jdow@earthlink.net>
Subject: Re: Partitions: Amiga RDB partition on 2 TB disk way too big, while
 OK in AmigaOS 4.1
Date: Sun, 17 Jun 2012 18:28:48 -0700
Message-ID: <4FDE8450.6090907@earthlink.net>
References: <201206170841.20222.Martin@lichtvoll.de> <CAMuHMdWY7=2nJDUjQFGPhdOAFGYeUsnvgPcaEvB2Gxf7P=E+Ug@mail.gmail.com> <4FDE46E4.7020009@earthlink.net> (sfid-20120617_231310_643468_CCA19A89) <201206172320.10272.Martin@lichtvoll.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from elasmtp-banded.atl.sa.earthlink.net ([209.86.89.70]:51281 "EHLO
	elasmtp-banded.atl.sa.earthlink.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751852Ab2FRB2x (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sun, 17 Jun 2012 21:28:53 -0400
In-Reply-To: <201206172320.10272.Martin@lichtvoll.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Martin Steigerwald <Martin@lichtvoll.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, linux-m68k@vger.kernel.org

On 2012/06/17 14:20, Martin Steigerwald wrote:
> Am Sonntag, 17. Juni 2012 schrieb jdow:
>> On 2012/06/17 09:36, Geert Uytterhoeven wrote:
>>> On Sun, Jun 17, 2012 at 2:58 PM, Martin Steigerwald
> <Martin@lichtvoll.de> wrote:
>>>> Am Sonntag, 17. Juni 2012 schrieb jdow:
>>>> | JXFS 64 bit file system
>>>> |
>>>> | With AmigaOS 4.x a new file system has been introduced called
>>>> | JXFS. It is a totally new 64 bit file system that supports
>>>> | partitions up to 16 TB in size. It is a modern journalling file
>>>> | system, which means that it reduces data loss if data writes to
>>>> | the disk are interrupted. It is the fastest and most reliable
>>>> | file system ever created for AmigaOS.
>>>>
>>>> http://www.amigaos.net/content/1/features
>>>>
>>>> Well I asked AmigaOS 4 developers about this issue as well. Lets s=
ee
>>>> what they say about 2 TB limits.
>>>
>>> 16 TB =3D 2 TB * 8. Perhaps they increased the block size from 512 =
to
>>> 4096?
>>>
>>> block/partitions/amiga.c reads the block size from
>>> RigidDiskBlock.rdb_BlockBytes,
>>> but after conversion to 512-byte blocks, all further calculations a=
re
>>> done on "int", so it will overflow for disks larger than 2 TiB.
>>>
>>> Note that in your profile-binary.img, the field is 0x200, i.e. 512
>>> bytes per block,
>>> so I'll have to get a deeper look into your RDB first...
> [=85]
>> Note that the work I did on the Linux RDB code eons ago took full
>> cognizance of the physical and virtual block sizes.
> [=85]
>> I've asked Martin for a digital copy of his RDBs and what he thinks =
the
>> partition(s) should look like. I should also be told whether the dis=
k
>> is supposed to be solely Amiga OSs or not. I gather it's not.
>
> Its all in the bug report. profile-binary.img should be it.
>
> Its small so I attach it.
>
> Meanwhile I try to get the currently supported maximum disk size out =
from
> the OS 4 developers. Maybe JXFS is playing tricks that other filesyst=
ems do
> not play or simply has a different implementation.
>
> Thanks,

I've sent Jens a proposed fix changing these lines in amiga.c.
=3D=3D=3D8<--- was
         struct PartitionBlock *pb;
         int start_sect, nr_sects, blk, part, res =3D 0;
         int blksize =3D 1;        /* Multiplier for disk block size */
=3D=3D=3D8<--- becomes changing line 338 into lines 338-339
         struct PartitionBlock *pb;
         sector_t start_sect, nr_sects;
         int blk, part, res =3D 0;
         int blksize =3D 1;        /* Multiplier for disk block size */
=3D=3D=3D8<---

(I'm working without proper tools at the moment or I'd make a real diff=
=2E
Sorry.)

This fix may not be complete. The RDBs contain provisions for describin=
g
the physical disk block size and how many physical blocks are used in a
file system's logical blocks. This MAY not work quite right large physi=
cal
block sizes.

{^_^}   Joanne Dow
