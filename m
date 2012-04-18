From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: Make sure {read,write}s[bwl]() are always defined
Date: Wed, 18 Apr 2012 22:45:58 +1000
Message-ID: <4F8EB786.8000000@snapgear.com>
References: <1334516410-5777-1-git-send-email-geert@linux-m68k.org> <4F8C08F1.5050907@snapgear.com> <4F8E7458.8030301@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4F8E7458.8030301@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On 04/18/2012 05:59 PM, Michael Schmitz wrote:
> Greg,
>>>         Or do you want musb_io.h to check for
>>>         "!(defined(CONFIG_M68K)&&   defined(CONFIG_MMU))" instead?
>>
>> No, I would rather see just the defined(CONFIG_M68K), and no check for
>> CONFIG_MMU. I am pretty sure there is some similarity between the way
>> the Atari does ISA bus interfacing to what some of the ColdFire boards
>> do.
> I sure hope you are wrong :-) But I think I saw some non-MMU Atari use
> attempts mentioned on the list, and the ROM port ISA adapter could well
> be used on non-MMU Ataris (though I'm not sure what address the ROM port
> would be mapped at on those - I'm sure Andreas will know the details
> there).

I wasn't referring to the ROM port exactly as it is on Atari playtforms.
But some ColdFire based boards I have seen do ISA busses with some
pretty funky wiring of addresses and data lines to be able to do 8bit
accesses on even and odd boundaries, but also allow 16bit accesses.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
