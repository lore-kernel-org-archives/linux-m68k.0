From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: How to get m68k sources?
Date: Sun, 12 Apr 2009 08:53:02 +0200
Message-ID: <m23ace1hyp.fsf@linux-m68k.org>
References: <alpine.LNX.2.01.0904102301250.22946@halbrend.uninett.no>
	<10f740e80904110116j6626b564m92b0fbf9fca79106@mail.gmail.com>
	<m2ab6nts2u.fsf@igel.home>
	<alpine.LNX.2.01.0904120619100.22946@halbrend.uninett.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:49648 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753416AbZDLGwm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 12 Apr 2009 02:52:42 -0400
In-Reply-To: <alpine.LNX.2.01.0904120619100.22946@halbrend.uninett.no>
	(=?utf-8?Q?=22Kolbj=C3=B8rn?= Barmen"'s message of "Sun, 12 Apr 2009
 06:35:27 +0200
	(CEST)")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?utf-8?Q?Kolbj=C3=B8rn?= Barmen <linux-m68k@kolla.no>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Kolbj=C3=B8rn Barmen <linux-m68k@kolla.no> writes:

> On Sat, 11 Apr 2009, Andreas Schwab wrote:
>
>> After cloning the repository you first have to create the tracking
>> m68k-v2.6.29 branch:
>>=20
>> $ git checkout -t origin/m68k-v2.6.29
>
> did you test this?

Of course.  Which git version do you have?  I have git 1.6.2.2.

> [kolla@haugum] /home/kolla/linux-m68k $ git checkout -t -b origin/m68=
k-v2.6.29
> Branch origin/m68k-v2.6.29 set up to track local branch refs/heads/ma=
ster.
> Switched to a new branch "origin/m68k-v2.6.29"

The argument to -b must be the (new) local branch.  This is the
equivalent command line for old versions of git:

$ git checkout -t -b m68k-v2.6.29 origin/m68k-v2.6.29

Andreas.

--=20
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint =3D 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4=
ED5
"And now for something completely different."
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
