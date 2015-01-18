From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: CONFIG_DEVTMPFS_MOUNT
Date: Sun, 18 Jan 2015 12:07:39 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1501181206220.1142@herc.mirbsd.org>
References: <CAMuHMdV413F57YQw_ODzjgYAi4ndVgOvJ39k_kL0yksCQF5jAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <CAMuHMdV413F57YQw_ODzjgYAi4ndVgOvJ39k_kL0yksCQF5jAg@mail.gmail.com>
Content-Language: de-DE-1901, en-GB
Resent-Message-ID: <2fXNaOhT4OL.A.KrD.OS6uUB@bendel>
List-URL: <http://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stefan Niestegge <beetle@atari.org>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Geert Uytterhoeven dixit:

>While init on Beetle's system complained about not being able to open
>tty* with CONFIG_DEVTMPFS_MOUNT disabled, enabling CONFIG_DEVTMPFS_MOUNT
>broke remote login using ssh on my ARAnyM:

Hm, interesting.

If you do not run udev, you may need the following lines in /etc/rc.local:

(test -e /dev/fd || ln -s /proc/self/fd /dev/fd || :)
(test -e /dev/stdin || ln -s /proc/self/fd/0 /dev/stdin || :)
(test -e /dev/stdout || ln -s /proc/self/fd/1 /dev/stdout || :)
(test -e /dev/stderr || ln -s /proc/self/fd/2 /dev/stderr || :)

Otherwise=E2=80=A6 redo with ssh -vvv and possibly log in locally to it, ki=
ll
the ssh service, and run it in a one-shot manually:

/usr/sbin/sshd -ddde 2>&1 | tee log

bye,
//mirabilos
--=20
<igli> exceptions: a truly awful implementation of quite a nice idea.
<igli> just about the worst way you could do something like that, afaic.
<igli> it's like anti-design.  <mirabilos> that too=E2=80=A6 may I quote yo=
u on that?
<igli> sure, tho i doubt anyone will listen ;)
