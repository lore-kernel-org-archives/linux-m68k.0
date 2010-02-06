From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: m68k/for-2.6.34
Date: Sat, 06 Feb 2010 21:08:55 +1000
Message-ID: <4B6D4DC7.7050802@snapgear.com>
References: <10f740e81002011212t91a087bkeb77dac23f5676e0@mail.gmail.com>	
	<4B6B33EC.9000102@codesourcery.com>
	<10f740e81002060144l7850f81ftd516600c27a33c7c@mail.gmail.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <10f740e81002060144l7850f81ftd516600c27a33c7c@mail.gmail.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, uClinux development list <uclinux-dev@uclinux.org>, Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org


On 02/06/2010 07:44 PM, Geert Uytterhoeven wrote:
> On Thu, Feb 4, 2010 at 21:54, Maxim Kuvyrkov<maxim@codesourcery.com>  wrote:
>> On 2/1/10 11:12 PM, Geert Uytterhoeven wrote:
>> ...
>>>
>>> Should I add the NPTL support for m68k and m68knommu, or shall I wait
>>> for 2.6.35?
>>
>> Notwithstanding the bias, I think you should merge the NPTL support. The
>> NPTL changes don't touch any of the existing functionality, they only add
>> the new syscalls, so the risk of breaking something is negligible.
>
> OK for me. Greg, OK for m68knommu, too?

Yep, good for m68knommu too.

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
