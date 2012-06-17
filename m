From: Martin Steigerwald <Martin@lichtvoll.de>
Subject: Re: Partitions: Amiga RDB partition on 2 TB disk way too big, while OK in AmigaOS 4.1
Date: Sun, 17 Jun 2012 14:58:58 +0200
Message-ID: <201206171458.58462.Martin@lichtvoll.de>
References: <201206170841.20222.Martin@lichtvoll.de> <4FDDB667.4020609@earthlink.net> (sfid-20120617_144808_729301_F71ACE9D)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mondschein.lichtvoll.de ([194.150.191.11]:35369 "EHLO
	mail.lichtvoll.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757220Ab2FQM67 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 17 Jun 2012 08:58:59 -0400
In-Reply-To: <4FDDB667.4020609@earthlink.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: jdow <jdow@earthlink.net>
Cc: linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, linux-m68k@vger.kernel.org

Am Sonntag, 17. Juni 2012 schrieb jdow:
> I'll have to make time to look it over, considering I am more or less
> the mommy of the RDBs. Now, 2TB may be a tad beyond the abilities of
> the RDBs to express. Memory insists that the RDBs worked on either
> BYTE or block counts. Your seeing a problem at 2TB suggests it really
> stored bit counts. The numbers are supposed to be unsigned. And wheth=
er
> the RDBs store values in blocks or BYTEs is immaterial when you get
> down to it. (The RDBs do store the disk's actual and virtual block
> sizes. The latter is what the filesystem uses.)

Hmmm, I thought any 2 TB limit was gone meanwhile, but then your=20
argumentation has some merit.

Some hints that it might be gone nonetheless:

| JXFS 64 bit file system
|
| With AmigaOS 4.x a new file system has been introduced called JXFS. I=
t is=20
| a totally new 64 bit file system that supports partitions up to 16 TB=
 in=20
| size. It is a modern journalling file system, which means that it red=
uces=20
| data loss if data writes to the disk are interrupted. It is the faste=
st=20
| and most reliable file system ever created for AmigaOS.

http://www.amigaos.net/content/1/features

Well I asked AmigaOS 4 developers about this issue as well. Lets see wh=
at=20
they say about 2 TB limits.

But nonetheless, I think, Linux should refuse to use a partition that i=
s=20
clearly out of bound.

Scrubbing the one backup BTRFS that has 360 GiB of data was okay. Also =
the=20
fsck=B4s went well. Well the volume group is not completely full so som=
e=20
space on the end of the disk is not yet used by it.

I am recreating all my backups on BTRFS volumes now - except maybe the =
one=20
thats on the BTRFS volume already and scrubs okay.

Ciao,
--=20
Martin 'Helios' Steigerwald - http://www.Lichtvoll.de
GPG: 03B0 0D6C 0040 0710 4AFA  B82F 991B EAAC A599 84C7
