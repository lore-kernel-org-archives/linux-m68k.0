From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Wed, 11 Sep 2013 16:48:34 +0200
Message-ID: <CAMuHMdUH=9sv-Vb3ZTAGyfvEQOO0x0x1cUYhfd7040k8d+bSYg@mail.gmail.com>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org>
	<520D4AE3.6040801@aalto.fi>
	<520E76FC.9040803@aalto.fi>
	<11425cb5ec432e2fbb7b675052e8b33d@gmail.com>
	<520F5F81.7090409@aalto.fi>
	<52102BEC.7000006@gmail.com>
	<CAMuHMdV9vP-Qg2my5fyT+pa_WcDfZAPx5T1-4kXP8eD1oL8Kog@mail.gmail.com>
	<52108CAF.1010700@gmail.com>
	<CAMuHMdWqNBjHKiDojPdjzuOV65QXzjeMX5VbtUvgU7VTP4iYFg@mail.gmail.com>
	<5211DBD8.5090801@gmail.com>
	<5212840A.4080300@aalto.fi>
	<1ef2d87e4efecb2d8c8c2eaf8ac5fd51@gmail.com>
	<52133E48.50501@aalto.fi>
	<CAOmrzkKtB4OpnFNFh9PR4V8bc3ExfFXpwtkhGj0veQ4w-d=cqA@mail.gmail.com>
	<522F8B67.2080603@aalto.fi>
	<CAOmrzkKP4YcvnHcrtucMvS9WSaeg+6-qnobOWN6hBK=wkUHemg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:59326 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753959Ab3IKOsf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 11 Sep 2013 10:48:35 -0400
Received: by mail-pd0-f180.google.com with SMTP id y10so9219951pdj.25
        for <linux-m68k@vger.kernel.org>; Wed, 11 Sep 2013 07:48:34 -0700 (PDT)
In-Reply-To: <CAOmrzkKP4YcvnHcrtucMvS9WSaeg+6-qnobOWN6hBK=wkUHemg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Tuomas Vainikka <tuomas.vainikka@aalto.fi>, Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Sep 11, 2013 at 12:12 PM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>> problem. Using PIO, only the first byte of the tag message comes through. It
>> might not be esp_scsi's fault, but there seems to be an assumption that all
>> devices support TCQ. Also, no SCSI-2 features seem to be enabled in the chip
>> by esp_scsi.
>
> I'd have to check with DaveM, but such an assumption might in fact exist.

BTW, it would be nice to start CCing linux-scsi@vger.kernel.org and
David S. Miller <davem@davemloft.net> on future discussions.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
