From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 00/12] m68knommu: generalize the ColdFire
 clock support for all CPU types
Date: Tue, 27 Nov 2012 08:49:07 +1000
Message-ID: <50B3F1E3.8040004@snapgear.com>
References: <1353041256-2959-1-git-send-email-gerg@snapgear.com>
 <20121126163431.62231f3b@skate>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <20121126163431.62231f3b@skate>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: linux-m68k@vger.kernel.org, uClinux development list <uclinux-dev@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

Hi Thomas,

On 11/27/2012 01:34 AM, Thomas Petazzoni wrote:
> On Fri, 16 Nov 2012 14:47:24 +1000, gerg@snapgear.com wrote:
>> The current Coldfire clock code only really supports those ColdFire
>> CPU types that have the more advanced enable/disable clock hardware
>> support. If we generalize our clock code we can support all types,
>> even those with simpler fixed clock trees.
>>
>> This results in much cleaner and consistent clock support. And it
>> means that we can in the future use the clock API in our timers and
>> throughout the other ColdFire p[eripheraps, instead of hard coded
>> clock definitions.
>
> Have you considered instead using the generic clock framework that is
> now in drivers/clk/ ?

I have, and that is what I plan to do next. This set of patches
was intended to clean up (and generalize) what we currently have.
It doesn't really change the current ColdFire clocking code in
any way, just makes it work consistently across all CPU types.

Regards
Greg


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
