From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 00/22] m68knommu: simplify ColdFire GPIO
	init code
Date: Thu, 26 Apr 2012 20:02:29 +1000
Message-ID: <4F991D35.1060500@snapgear.com>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
 <201204260028.47328.sfking@fdwdc.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <201204260028.47328.sfking@fdwdc.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: Steven King <sfking@fdwdc.com>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
List-Id: linux-m68k@vger.kernel.org

Hi Steven,

On 04/26/2012 05:28 PM, Steven King wrote:
> On Wednesday 25 April 2012 5:25:40 pm gerg@snapgear.com wrote:
>> The GPIO init code for the ColdFire cores is a set of very large tables,
>> one for each ColdFire SoC type. Each SoC type has very different GPIO pin
>> arrangements, so one for each is unavoidable. But there is fundamentaly
>> two types of setup/access that we are trying to support.
>>
>> With some pre-processor macro magic we can reduce the tables significantly,
>> making them easier to read, easier to get correct, and easier to maintain.
>>
>> The following patches implement a set of simplifying changes. What do
>> others think?  Overall we remove close to 2000 lines of code, and the end
>> tables are much easier to read and get correct.
>>
>
> Hi Greg,
>
> This looks fine to me.
> You can add my Acked-by: Steven King<sfking@fdwdc.com>

Great, thanks.

Regards
Greg


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
