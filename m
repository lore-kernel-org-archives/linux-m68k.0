From: David Binderman <dcb314@hotmail.com>
Subject: arch/m68k/mac/oss.c:51: bad for loop ?
Date: Fri, 27 Mar 2015 16:15:23 +0000
Message-ID: <DUB128-W48788F7BD62EB2FDF776C79C090@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "funaho@jurai.org" <funaho@jurai.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>

Hello there,

arch/m68k/mac/oss.c:51:21: warning: iteration 16u invokes undefined beh=
avior [-Waggressive-loop-optimizations]

=A0=A0=A0 for (i =3D 0; i <=3D OSS_NUM_SOURCES; i++) {
=A0=A0=A0=A0=A0=A0=A0 oss->irq_level[i] =3D 0;
=A0=A0=A0 }

Maybe better code

=A0=A0=A0 for (i =3D 0; i < OSS_NUM_SOURCES; i++) {
=A0=A0=A0=A0=A0=A0=A0 oss->irq_level[i] =3D 0;
=A0=A0=A0 }

Regards

David Binderman

 		 	   		  --
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
