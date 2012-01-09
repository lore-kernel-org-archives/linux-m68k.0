From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Atari TT (next)
Date: Mon, 9 Jan 2012 16:16:22 +1300
Message-ID: <CAOmrzkL-wrOumzdBAWsCd3qWTkan2m_-g+ovGQetO8CNjs80hg@mail.gmail.com>
References: <4F079F6B.8080502@fairlite.co.uk>
	<4F07EA66.6020603@gmail.com>
	<4F08E748.4020305@fairlite.co.uk>
	<4F0917E9.9090600@gmail.com>
	<4F0964EC.2080505@fairlite.co.uk>
	<CAOmrzkLH18VCY0dzJPM14dn5ccWmSBkiPzq8EFqnCDHiM3bECQ@mail.gmail.com>
	<4F0A2DD0.4000707@fairlite.co.uk>
	<CAOmrzk+P3mPXu_Q_KxgEk_jx-JNhXY4ydrKoGM+43LpD5icTHw@mail.gmail.com>
	<4F0A3CDE.7070308@fairlite.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:60782 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755164Ab2AIDQX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jan 2012 22:16:23 -0500
Received: by pbdu13 with SMTP id u13so1962894pbd.19
        for <linux-m68k@vger.kernel.org>; Sun, 08 Jan 2012 19:16:22 -0800 (PST)
In-Reply-To: <4F0A3CDE.7070308@fairlite.co.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alan Hourihane <alanh@fairlite.co.uk>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Alan,

>
> Next problem is the SCSI controller.

My absolute favourite.

> NCR5380 core release=3D7.
> NCR5380: coroutine isn't running.
> scsi0: no currently connected command
> scsi0: issue_queue
> scsi0: disconnected_queue
> scsi0: destination target 0, lun 0
> =A0 =A0 =A0 =A0command =3D 18 (0x12) 00 00 00 24 00
>
> scsi 0:0:0:0: Device offlined - not ready after error recovery
>
> I'll start poking at this.

If you can get the error recovery sorted, I'd be happy to start poking
at Falcon SCSI again.

(Yes, I know a cold boot sorted it for now - just in case you can get
it to get stuck again)

Congrats to getting this far at least - I have no idea on the initrd th=
ough.

Cheers,

  Michael
