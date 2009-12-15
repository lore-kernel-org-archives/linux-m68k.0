From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH] Keys: KEYCTL_SESSION_TO_PARENT needs TIF_NOTIFY_RESUME
	architecture support
Date: Tue, 15 Dec 2009 15:25:50 -0500
Message-ID: <8bd0f97a0912151225j12d29d23x4383b0ddf00f0012__26511.5635389977$1260909181$gmane$org@mail.gmail.com>
References: <alpine.DEB.2.00.0912132013050.26173@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0912132013050.26173@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Chris Zankel <chris@zankel.net>, Linux Kernel Development <linux-kernel@vger.kernel.org>, linux-security-module@vger.kernel.org

On Sun, Dec 13, 2009 at 14:21, Geert Uytterhoeven wrote:
> + =C2=A0 =C2=A0 =C2=A0 /*
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* To be removed when TIF_NOTIFY_RESUME h=
as been implemented on
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* blackfin/m68k/xtensa

if you feel like respinning, you can drop the "blackfin" part as ive
pushed support for 2.6.33
-mike
