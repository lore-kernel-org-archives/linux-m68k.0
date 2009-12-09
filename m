From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: Add private syscalls to support NPTL
Date: Wed, 09 Dec 2009 14:05:25 +0300
Message-ID: <4B1F8475.7000300@codesourcery.com>
References: <4A89D037.7090807@codesourcery.com> <4B1CBEE8.7000907@codesourcery.com> <08E1D88E-249F-4C5B-8F00-519659DC912E@parq.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([38.113.113.100]:35885 "EHLO
	mail.codesourcery.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753986AbZLILF2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 9 Dec 2009 06:05:28 -0500
In-Reply-To: <08E1D88E-249F-4C5B-8F00-519659DC912E@parq.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Klaus Kuehnhammer <klaus@parq.net>
Cc: linux-m68k@vger.kernel.org

Klaus Kuehnhammer wrote:
> Hi!
> 
> I've been testing this patch (together w/the latest codesourcery toolchain release) on an m548x the last couple of days.
> 
> It looks like there is still an issue in sys_atomic_cmpxchg_32. When cloning a large process, it accesses memory it shouldn't:

Hi Klaus,

Which kernel version are you using?  Where does the kernel oops?  Is it 
at `mem_value = *mem;' ?

Regards,

-- 
Maxim Kuvyrkov
CodeSourcery
maxim@codesourcery.com
(650) 331-3385 x724
