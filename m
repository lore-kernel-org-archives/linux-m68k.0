From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: m68k v3.16 status update
Date: Sat, 09 Aug 2014 10:25:48 +1200
Message-ID: <53E54E6C.2040806@gmail.com>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com> <53E48C84.9090709@gmail.com> <53E4DDF1.9060701@kopteri.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <53E4DDF1.9060701@kopteri.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Tuomas Vainikka <tuomas.vainikka@kopteri.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Debian m68k <debian-68k@lists.debian.org>

Hi Tuomas,
>>
>> There's still the Amiga Zorro ESP patch out in limbo - DaveM 
>> suggested a change to enable SCSI-2 features to help with extended 
>> message bytes but that did not work as intended. Haven't had time to 
>> follow that one up. Tuomas' fix to the driver to bypass DMA for 
>> message in works OK though - do you want it submitted back to 
>> linux-scsi as is, or wait for a perfect solution (pun on me ...)?
>>
>>
> Just to refresh your memory, the final fix was not to bypass DMA at 
> any level (I did that for the command transfer, but that didn't help), 
> but to have a dedicated slave_configure() function in the Amiga Zorro 
> ESP driver that would not enable TCQ.

You guessed right about memory failing me - it wasn't about DMA in the 
end (for some reason, I seem to have DMA stuck in my mind at the 
moment), Do you see any other avenues to try and enable tagged commands 
in the ESP chip? We tried one config register only so far...

Cheers,

    Michael
