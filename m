From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: CONFIG_DEVTMPFS_MOUNT
Date: Mon, 19 Jan 2015 09:52:06 +1300
Message-ID: <CAOmrzk+G_wvLtCDeuo-R9_xFcqNfUp3=6Dxd0xK+_2e_wXkASA@mail.gmail.com>
References: <CAMuHMdV413F57YQw_ODzjgYAi4ndVgOvJ39k_kL0yksCQF5jAg@mail.gmail.com>
	<Pine.BSM.4.64L.1501181206220.1142@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-qc0-f179.google.com ([209.85.216.179]:50674 "EHLO
	mail-qc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751596AbbARUwH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 18 Jan 2015 15:52:07 -0500
Received: by mail-qc0-f179.google.com with SMTP id w7so3285294qcr.10
        for <linux-m68k@vger.kernel.org>; Sun, 18 Jan 2015 12:52:06 -0800 (PST)
In-Reply-To: <Pine.BSM.4.64L.1501181206220.1142@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stefan Niestegge <beetle@atari.org>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

This is what I have used since - called from rcS.d as S37mountdevpts.sh=
 :


#
# mountdevpts.sh    Mount devpts filesystem.
#
# Version:    @(#)mountall.sh  2.85-23  29-Jul-2004  miquels@cistron.nl
#

#
# We might have mounted something over /dev, see if /dev/pts is there.
#
if [ ! -d /dev/pts ]
then
    rm -f /dev/pts
    mkdir /dev/pts
fi

#
# Mount local file systems in /etc/fstab.
#
[ "$VERBOSE" !=3D no ] && echo "Mounting devpts filesystem..."
mount -av -t devpts 2>&1 |
    egrep -v '(already|nothing was) mounted'


: exit 0

Typos and other faults mine. Runs on a dark ages version of Debian
(3.1 with locl mods).

Cheers,

  Michael



On Mon, Jan 19, 2015 at 1:07 AM, Thorsten Glaser <tg@mirbsd.de> wrote:
> Geert Uytterhoeven dixit:
>
>>While init on Beetle's system complained about not being able to open
>>tty* with CONFIG_DEVTMPFS_MOUNT disabled, enabling CONFIG_DEVTMPFS_MO=
UNT
>>broke remote login using ssh on my ARAnyM:
>
> Hm, interesting.
>
> If you do not run udev, you may need the following lines in /etc/rc.l=
ocal:
>
> (test -e /dev/fd || ln -s /proc/self/fd /dev/fd || :)
> (test -e /dev/stdin || ln -s /proc/self/fd/0 /dev/stdin || :)
> (test -e /dev/stdout || ln -s /proc/self/fd/1 /dev/stdout || :)
> (test -e /dev/stderr || ln -s /proc/self/fd/2 /dev/stderr || :)
>
> Otherwise=E2=80=A6 redo with ssh -vvv and possibly log in locally to =
it, kill
> the ssh service, and run it in a one-shot manually:
>
> /usr/sbin/sshd -ddde 2>&1 | tee log
>
> bye,
> //mirabilos
> --
> <igli> exceptions: a truly awful implementation of quite a nice idea.
> <igli> just about the worst way you could do something like that, afa=
ic.
> <igli> it's like anti-design.  <mirabilos> that too=E2=80=A6 may I qu=
ote you on that?
> <igli> sure, tho i doubt anyone will listen ;)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
