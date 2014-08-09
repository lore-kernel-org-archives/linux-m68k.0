From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: m68k v3.16 status update
Date: Sat, 09 Aug 2014 13:14:43 +1200
Message-ID: <53E57603.50004@gmail.com>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com> <53E48C84.9090709@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <53E48C84.9090709@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

Hi Geert,
>>
>> That leaves us with:
>>   - Atari EtherNAT: Should be fairly easy to get in. Is the current 
>> driver still
>>     working? If yes, I'm willing to send the patch to netdev myself.
>>   
>
> Last time I had a chance to try this on a non-broken EtherNAT, it was 
> fine (two years ago IIRC). Need to ask Christian again to test the 
> current one. There was one change you suggested after that time 
> (dropping a dodgy cast was part of it) - that bit got never tested. It 
> should work from what we discussed, but that's not a strong enough 
> argument.

I should clarify - the current code does detect the SMC chip OK, it just 
doesn't receive any  MII interrupts on my card. I probably fried my MII 
interface. I am quite confident it will still work on a fully functional 
EtherNAT.

Cheers,

    Michael
