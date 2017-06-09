From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 1/2] arch: Define CPU_BIG_ENDIAN for all fixed big
 endian archs
Date: Fri, 09 Jun 2017 12:40:25 -0400 (EDT)
Message-ID: <20170609.124025.1597341888979066145.davem@davemloft.net>
References: <1496960243-196898-1-git-send-email-babu.moger@oracle.com>
        <1496960243-196898-2-git-send-email-babu.moger@oracle.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:33820 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751803AbdFIQk3 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 9 Jun 2017 12:40:29 -0400
In-Reply-To: <1496960243-196898-2-git-send-email-babu.moger@oracle.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: babu.moger@oracle.com
Cc: ysato@users.sourceforge.jp, geert@linux-m68k.org, jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com, jejb@parisc-linux.org, deller@gmx.de, viro@zeniv.linux.org.uk, mpe@ellerman.id.au, peterz@infradead.org, mingo@redhat.com, jcmvbkbc@gmail.com, linux-kernel@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, linux-m68k@vger.kernel.org, openrisc@lists.librecores.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org

From: Babu Moger <babu.moger@oracle.com>
Date: Thu,  8 Jun 2017 15:17:22 -0700

> While working on enabling queued rwlock on SPARC, found
> this following code in include/asm-generic/qrwlock.h
> which uses CONFIG_CPU_BIG_ENDIAN to clear a byte.
> 
> static inline u8 *__qrwlock_write_byte(struct qrwlock *lock)
>  {
> 	return (u8 *)lock + 3 * IS_BUILTIN(CONFIG_CPU_BIG_ENDIAN);
>  }
> 
> Problem is many of the fixed big endian architectures dont define
> CPU_BIG_ENDIAN and clears the wrong byte.
> 
> Define CPU_BIG_ENDIAN for all the fixed big endian architecture.
> 
> Here is the orinal discussion
> http://www.spinics.net/lists/devicetree/msg178101.html
> 
> Signed-off-by: Babu Moger <babu.moger@oracle.com>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: David S. Miller <davem@davemloft.net>
