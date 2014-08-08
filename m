From: Tuomas Vainikka <tuomas.vainikka@kopteri.net>
Subject: Re: m68k v3.16 status update
Date: Fri, 08 Aug 2014 17:25:53 +0300
Message-ID: <53E4DDF1.9060701@kopteri.net>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com> <53E48C84.9090709@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <53E48C84.9090709@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, Debian m68k <debian-68k@lists.debian.org>

On 08.08.2014 11:38, Michael Schmitz wrote:
>
> There's still the Amiga Zorro ESP patch out in limbo - DaveM suggested 
> a change to enable SCSI-2 features to help with extended message bytes 
> but that did not work as intended. Haven't had time to follow that one 
> up. Tuomas' fix to the driver to bypass DMA for message in works OK 
> though - do you want it submitted back to linux-scsi as is, or wait 
> for a perfect solution (pun on me ...)?
>
> Support for more Amiga ESP cards needs to be added (got dropped in 
> overlapping edits between Tuomas and me, better to make a clean break 
> there). More testers needed at any rate.
> Conclusion - I see good chances on the EtherNEC one, ditto on the 
> EtherNAT if we can get it tested. Need to go back and check the FAT 
> stuff but would suspect it is still needed - if no one but me needs 
> this it could keep living in my local tree though.
>
Just to refresh your memory, the final fix was not to bypass DMA at any 
level (I did that for the command transfer, but that didn't help), but 
to have a dedicated slave_configure() function in the Amiga Zorro ESP 
driver that would not enable TCQ.

-Tuomas
