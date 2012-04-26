From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 01/22] m68knommu: introduce macros to
 simplify ColdFire GPIO table initialization
Date: Thu, 26 Apr 2012 19:59:23 +1000
Message-ID: <4F991C7B.2030406@snapgear.com>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
 <1335399962-10308-2-git-send-email-gerg@snapgear.com>
 <20120426071610.GA31640@frolo.macqel>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <20120426071610.GA31640@frolo.macqel>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: Philippe De Muyter <phdm@macqel.be>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

Hi Philippe,

On 04/26/2012 05:16 PM, Philippe De Muyter wrote:
> Hi Greg,
>
> On Thu, Apr 26, 2012 at 10:25:41AM +1000, gerg@snapgear.com wrote:
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> We have very large tables in the ColdFire CPU GPIO setup code that essentially
>> boil down to 2 distinct types of GPIO pin initiaization. Using 2 macros we can
>> reduce these large tables to at most a dozen lines of setup code, and in quite
>> a few cases a single table entry.
>>
>> Introduce these 2 macros into the existing mcfgpio.h header.
> ...
>> +/*
>> + *	Define macros to ease the pain of setting up the gpio tables.
>> + */
>> +#define	MCFGPS(mlabel, mbase, mngpio, mpddr, mpodr, mppdr)		    \
> ...
>> +#define	MCFGPF(mlabel, mbase, mngpio)					    \
> ...
>
> Maybe a small comment to explain when to use MCFGPS and when to use MCFGPF ?

Yep, that sounds like a good idea. I'll do that.

Thanks
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
