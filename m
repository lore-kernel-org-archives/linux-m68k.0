From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: Network died completely in 2.6.29 - also on m68k :)
Date: Sun, 19 Apr 2009 02:19:46 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0904190208550.7064@zirkon.biophys.uni-duesseldorf.de>
References: <alpine.LNX.2.01.0904160950280.9424@halbrend.uninett.no>
 <10f740e80904180228y222381e9sbbac7702b5624891@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_ssdwyrRn9NIW5fxB6UePiQ)"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-apollo.uni-duesseldorf.de ([134.99.128.36]:56034 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754193AbZDSATu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sat, 18 Apr 2009 20:19:50 -0400
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KIB00B00NKZV900@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Sun, 19 Apr 2009 02:19:47 +0200 (MEST)
In-reply-to: <10f740e80904180228y222381e9sbbac7702b5624891@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?ISO-8859-15?Q?Kolbj=F8rn_Barmen?= <linux-m68k@kolla.no>, linux-m68k@vger.kernel.org, Debian m68k <debian-68k@lists.debian.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--Boundary_(ID_ssdwyrRn9NIW5fxB6UePiQ)
Content-type: TEXT/PLAIN; charset=UTF-8
Content-transfer-encoding: QUOTED-PRINTABLE

Hi Geert,

> > So, I tryed to pull out a m68k-v2.6.29.1 from git, but appearantly ther=
e is no
> > such thing. So=C2=B8 it is probably to add the "Disable GRO on legacy n=
etif_rx
> > path" patch (in posting above) to the v2.6.29 branch, no?
>=20
> Usually I do not track stable myself, that's a distributor's issue ;-)
> But I gave it a try, and did:
>=20
>     git remote add stable
> git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-2.6-stable.git
>     git remote update
>     git merge v2.6.29.1
>=20
> (git merge stable/linux-2.6.29.y should have worked, too)
> and pushed the result to m68k-v2.6.29. However, I don't know if I
> should keep on doing
> this for each stable release, as you can easily do it yourself,
> without having to wait for me.

But it's so much easier if you do it :-) With that description, there's no=
=20
reason why it could not be done by someone else, though. I don't think ther=
e is=20
enough demand for a stable m68k kernel git tree to warrant that extra tree.=
 It=20
would be a matter of setting up a separate git repository, right?=20
=20
> Furthermore, it complicates the process of extracting patches for e.g.
> the Debian kernel,
> unless I would rebase the m68k-v2.6.29 branch on top of the latest
> stable version.
> But I prefer not to rebase long-lived branches like the stable branch.
>=20
> What do people think?

I think a distributor, i.e. Debian will pick up the patch in question as pa=
rt of=20
the generic bugfixes anyway. Having it appear a second time as part of the =
m68k=20
patches would make things harder, really.=20

Don't rebase m68k-v2.6.29 unless absolutely necessary, please.=20

=09Michael=

--Boundary_(ID_ssdwyrRn9NIW5fxB6UePiQ)--
