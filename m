From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: Add private syscalls to support NPTL
Date: Thu, 10 Dec 2009 12:18:42 +0300
Message-ID: <4B20BCF2.9050005@codesourcery.com>
References: <4A89D037.7090807@codesourcery.com> <4B1CBEE8.7000907@codesourcery.com> <08E1D88E-249F-4C5B-8F00-519659DC912E@parq.net> <4B1F8475.7000300@codesourcery.com> <DBFD40BF-19FC-47DF-8A7C-B71261AFBD85@parq.net> <4B1F9492.6030604@codesourcery.com> <F139AB5C-ED7E-4664-AB7E-AD9EFFEF9DDD@bitstem.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([38.113.113.100]:53501 "EHLO
	mail.codesourcery.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757917AbZLJJT0 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 10 Dec 2009 04:19:26 -0500
In-Reply-To: <F139AB5C-ED7E-4664-AB7E-AD9EFFEF9DDD@bitstem.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Klaus Kuehnhammer <klaus@bitstem.com>
Cc: linux-m68k@vger.kernel.org, Jin Zhengxiong-R64188 <R64188@freescale.com>

On 12/9/09 6:44 PM, Klaus Kuehnhammer wrote:
> Hello again,
>
> It looks like the issue is caused by the page being write-protected.
> Adding !pte_write(*pte) to the checks seems to fix this, it goes into
> page fault and reloads the page entry writable. A patch is attached.
>
> I'm not entirely comfortable w/this solution... I understand why
> calling do_page_fault w/a fixed RMW flag makes the write access work
> on the next iteration, but why would this page lack the write flag in
> the first place?

It may have the write bit cleared (or have a readonly bit set) when the 
page should be copied-on-write.  What strange is why !pte_dirty() 
doesn't imply !pte_write().  The cmpxchg code was ported from 
arm.c:traps.c; here is the comment to the patch that changed 
!pte_write() to !pte_dirty in ARM's implementation:

|pte_write() just says that the page _may_ be writable. It doesn't say
|that the MMU is programmed to allow writes. If pte_dirty() doesn't
|return true, that means that the page is _not_ writable from userspace.
|If you write to it from kernel mode (without using put_user) you'll
|bypass the MMU read-only protection and may end up writing to a page
|owned by two separate processes.

 From the above it seems that your patch is safe.  However, it may be 
papering over the consequences of a different bug.  Is there a linux 
memory management expert around to comment on this?

...

> Regarding the freescale kernel issues: Is there another kernel
> version we could try?

I sent a link to this thread to Jason (Jin) who's working at Freescale 
and he suggested you try the following patch and see if it fixes the 
problem.  This patch fixes a cache handling problem on some of the 
ColdFire CPUs.

-------------------
diff --git a/arch/m68k/coldfire/signal.c b/arch/m68k/coldfire/signal.c
index 38671c4..b1b2bfb 100644
--- a/arch/m68k/coldfire/signal.c
+++ b/arch/m68k/coldfire/signal.c
@@ -608,9 +608,8 @@ static inline int rt_setup_ucontext(struct ucontext
__user *uc,

  static inline void push_cache(unsigned long vaddr)
  {
-#if 0
-// JKM -- need to add into the old cpushl cache stuff
-       cf_cache_push(__pa(vaddr), 8);
+#ifdef CONFIG_M547X_8X
+       flush_icache_range(vaddr, vaddr + 8);
  #endif
  }
-------------------

Regards,

-- 
Maxim Kuvyrkov
CodeSourcery
maxim@codesourcery.com
(650) 331-3385 x724
