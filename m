From: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Subject: Re: How to get m68k sources?
Date: Mon, 13 Apr 2009 04:20:02 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.0904130408000.25462@halbrend.uninett.no>
References: <alpine.LNX.2.01.0904102301250.22946@halbrend.uninett.no> <10f740e80904110116j6626b564m92b0fbf9fca79106@mail.gmail.com> <m2ab6nts2u.fsf@igel.home> <alpine.LNX.2.01.0904120619100.22946@halbrend.uninett.no>
 <alpine.LNX.2.01.0904120815030.22946@halbrend.uninett.no>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ufisa.uninett.no ([158.38.152.126]:36119 "EHLO ufisa.uninett.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753013AbZDMCTI (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 12 Apr 2009 22:19:08 -0400
In-Reply-To: <alpine.LNX.2.01.0904120815030.22946@halbrend.uninett.no>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, 12 Apr 2009, Kolbj=C3=B8rn Barmen wrote:

> On Sun, 12 Apr 2009, Kolbj=C3=B8rn Barmen wrote:
>=20
> > So what now?
>=20
> I found a way - using some other git package as basis, I put together
> one m68k-sources-2.6.29.ebuild and one m68k-sources-2.6.9999.ebuild f=
or my
> gentoo/m68k project.

Only I didnt check carefully enough, both actually end up as 2.6.30 :(

halbrend m68k-sources # ebuild m68k-sources-2.6.29.ebuild unpack
 * checking ebuild checksums ;-) ...                                   =
                                       [ ok ]
 * checking auxfile checksums ;-) ...                                  =
                                       [ ok ]
 * checking miscfile checksums ;-) ...                                 =
                                       [ ok ]
>>> Preparing to unpack ...
>>> Not marked as unpacked; recreating WORKDIR...
>>> Unpacking source...
 * GIT update -->
 *    repository:               git://git.kernel.org/pub/scm/linux/kern=
el/git/geert/linux-m68k.git
 *    at the commit:            7251100873ebbb3df1f7a87f622cff9509a840e=
6
 *    tree:                     master
 *    branch:                   m68k-v2.6.29
 *    storage directory:        "/usr/portage/distfiles/git-src/linux-m=
68k.git"
Initialized empty Git repository in /var/tmp/portage/sys-kernel/m68k-so=
urces-2.6.29/work/linux-2.6.29-m68k/.git/
Checking out files: 100% (27662/27662), done.
Switched to a new branch "tree-master"
>>> Unpacked to /var/tmp/portage/sys-kernel/m68k-sources-2.6.29/work/li=
nux-2.6.29-m68k
>>> Source unpacked in /var/tmp/portage/sys-kernel/m68k-sources-2.6.29/=
work
halbrend m68k-sources # head -n5  /var/tmp/portage/sys-kernel/m68k-sour=
ces-2.6.29/work/linux-2.6.29-m68k/Makefile
VERSION =3D 2
PATCHLEVEL =3D 6
SUBLEVEL =3D 30
EXTRAVERSION =3D -rc1
NAME =3D Temporary Tasmanian Devil

Geh...

I tried using origin/m68k-v2.6.29 as branch, but that didnt work at all=
=2E

Oh well, I'll struggle on... :P


-- kolla
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
