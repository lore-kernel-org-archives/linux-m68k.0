From: Alan Hourihane <alanh@fairlite.co.uk>
Subject: Re: Atari TT (next)
Date: Mon, 09 Jan 2012 01:03:26 +0000
Message-ID: <4F0A3CDE.7070308@fairlite.co.uk>
References: <4F079F6B.8080502@fairlite.co.uk> <4F07EA66.6020603@gmail.com> <4F08E748.4020305@fairlite.co.uk> <4F0917E9.9090600@gmail.com> <4F0964EC.2080505@fairlite.co.uk> <CAOmrzkLH18VCY0dzJPM14dn5ccWmSBkiPzq8EFqnCDHiM3bECQ@mail.gmail.com> <4F0A2DD0.4000707@fairlite.co.uk> <CAOmrzk+P3mPXu_Q_KxgEk_jx-JNhXY4ydrKoGM+43LpD5icTHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from fairlite.demon.co.uk ([80.176.228.186]:56487 "EHLO
	fairlite.demon.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755078Ab2AIBD2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jan 2012 20:03:28 -0500
In-Reply-To: <CAOmrzk+P3mPXu_Q_KxgEk_jx-JNhXY4ydrKoGM+43LpD5icTHw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

On 09/01/12 00:05, Michael Schmitz wrote:
> What buffers? Filesystem buffers should be fine in TT-RAM. atafb
> buffer requirement could be reduced by using a low-res video mode
> perhaps (just to get past this point initially).

O.k. I've managed to cut down the kernel and boot with atafb enabled and
it works, using the stram_pool option.

Next problem is the SCSI controller.

I get......

Atari SCSI: resetting the SCSI bus... done
scsi0: options CAN_QUEUE=16 CMD_PER_LUN=8 SCAT-GAT=128 TAGGED-QUEUING=no
HOSTID=7 generic options AUTOSENSE REAL DMA SCSI-2 TAGGED QUEUING
generic release=7
scsi0 : Atari native SCSI
scsi0: aborting command
scsi 0:0:0:0: CDB: Inquiry: 12 00 00 00 24 00

NCR5380 core release=7.
NCR5380: coroutine isn't running.
scsi0: no currently connected command
scsi0: issue_queue
scsi0: disconnected_queue
scsi0: destination target 0, lun 0
        command = 18 (0x12) 00 00 00 24 00


NCR5380 core release=7.
NCR5380: coroutine isn't running.
scsi0: no currently connected command
scsi0: issue_queue
scsi0: disconnected_queue
scsi0: destination target 0, lun 0
        command = 18 (0x12) 00 00 00 24 00

scsi 0:0:0:0: Device offlined - not ready after error recovery

I'll start poking at this.

Alan.
