From: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Subject: Re: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Thu, 26 Sep 2013 17:04:31 +0300
Message-ID: <52443EEF.90309@aalto.fi>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org> <520D4AE3.6040801@aalto.fi> <520E76FC.9040803@aalto.fi> <11425cb5ec432e2fbb7b675052e8b33d@gmail.com> <520F5F81.7090409@aalto.fi> <52102BEC.7000006@gmail.com> <CAMuHMdV9vP-Qg2my5fyT+pa_WcDfZAPx5T1-4kXP8eD1oL8Kog@mail.gmail.com> <52108CAF.1010700@gmail.com> <CAMuHMdWqNBjHKiDojPdjzuOV65QXzjeMX5VbtUvgU7VTP4iYFg@mail.gmail.com> <5211DBD8.5090801@gmail.com> <5212840A.4080300@aalto.fi> <1ef2d87e4efecb2d8c8c2eaf8ac5fd51@gmail.com> <52133E48.50501@aalto.fi> <CAOmrzkKtB4OpnFNFh9PR4V8bc3ExfFXpwtkhGj0veQ4w-d=cqA@mail.gmail.com> <522F8B67.2080603@aalto.fi> <CAOmrzkKP4YcvnHcrtucMvS9WSaeg+6-qnobOWN6hBK=wkUHemg@mail.gmail.com> <52306B53.6030306@aalto.fi> <e063fd84a10c9413e4515c80ea4a139f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx04.aalto.fi ([130.233.222.103]:54025 "EHLO mx04.aalto.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750805Ab3IZOEe (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 26 Sep 2013 10:04:34 -0400
In-Reply-To: <e063fd84a10c9413e4515c80ea4a139f@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

On 09/26/2013 04:44 PM, Michael Schmitz wrote:
> Hello Tuomas,
>
> apologies for dropping off the conversation for so long - I only 
> returned from an overseas trip with only sporadic net access three 
> days ago.
>
>>> What exactly does your device support - SCSI-1, SCSI-2 CCS, SCSI-2 or
>>> higher? (Apologies for asking this - it will be in one of your old
>>> logs but I cannot easily read these here.)
>>>
>> The drive you would find by searching with the model number in the 
>> logs would point you to an IDE drive, which is actually connected to 
>> a bridge adapter (ACard AEC-7720U) that supports full Ultra SCSI 
>> features. I also have a 'real' ST51080N that supports Fast SCSI-2 
>> that I've also tested with the driver to no avail. I will double 
>> check again with the real SCSI drive to ascertain that the bridge 
>> adapter is not the culprit, just to make sure.
>
> I'm fully aware the info would have been in the logs, but all I had to 
> work with was a dodgy XP box at my in-law's place, and not a lot of 
> time to poke around.
>
> You have established that the SCSI bridge is responsible for a few odd 
> warnings but nothing serious, so I'd say we give your patched driver a 
> good workout on a number of Amiga m68k porter boxes, Unless you beat 
> me to it, I would suggest I provide a patch against Geert's latest 
> m68k development tree for someone else to integrate into the Debian 
> kernel package (would be a highly experimental one). Does that sound 
> fair?
>
Go ahead. I assume you can now open the attachments? If you could just 
make one small modification; all controllers but Oktagon use a 40 MHz 
clock. The zorro_esp driver versions I've been spamming to this list all 
have carried a bad 20 MHz clock setting for the Blizzard 2060 board.

I've actually been able to compile the driver into the kernel and use it 
for root fs (on my Blizzard 1230-IV).

-Tuomas
