From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: move to a single instance of
	free_initmem()
Date: Fri, 30 Nov 2012 14:24:24 +1000
Message-ID: <50B834F8.3070007@snapgear.com>
References: <1350963636-30424-1-git-send-email-gerg@snapgear.com>
 <CAMuHMdX5+gdM+jHEjLLZZJA8_oupeBP4CHbQrVHoE7CRuYBipQ@mail.gmail.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <CAMuHMdX5+gdM+jHEjLLZZJA8_oupeBP4CHbQrVHoE7CRuYBipQ@mail.gmail.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

Hi Geert,

On 11/11/12 20:43, Geert Uytterhoeven wrote:
> On Tue, Oct 23, 2012 at 5:40 AM,  <gerg@snapgear.com> wrote:
[snip]
>>   void free_initmem(void)
>>   {
>> -#ifdef CONFIG_RAMKERNEL
>> +#ifndef CONFIG_MMU_SUN3
>>          unsigned long addr;
>>
>> -       /*
>> -        * The following code should be cool even if these sections
>> -        * are not page aligned.
>> -        */
>> -       addr = PAGE_ALIGN((unsigned long) __init_begin);
>> -       /* next to check that the page we free is not a partial page */
>> -       for (; addr + PAGE_SIZE < ((unsigned long) __init_end); addr += PAGE_SIZE) {
>> +       addr = (unsigned long) __init_begin;
>> +       for (; addr < ((unsigned long) __init_end); addr += PAGE_SIZE) {
>>                  ClearPageReserved(virt_to_page(addr));
>>                  init_page_count(virt_to_page(addr));
>>                  free_page(addr);
>>                  totalram_pages++;
>>          }
>>          pr_notice("Freeing unused kernel memory: %luk freed (0x%x - 0x%x)\n",
>> -               (addr - PAGE_ALIGN((unsigned long) __init_begin)) >> 10,
>> -               (int)(PAGE_ALIGN((unsigned long) __init_begin)),
>> -               (int)(addr - PAGE_SIZE));
>> -#endif
>> +               (addr - (unsigned long) __init_begin) >> 10,
>> +               (unsigned int) __init_begin, (unsigned int) __init_end);
>
> Which is now BTW almost identical to free_initrd_mem(), so the common
> parts can be extracted in a helper function.

Indeed it can. Well spotted :-)

Patch coming up.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
