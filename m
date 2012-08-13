From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: [userns:userns-always-map-user-v45 80/99] fs/namespace.c:2290:1: error: unknown type name 'atomic64_t'
Date: Sun, 12 Aug 2012 23:56:45 -0700
Message-ID: <87k3x3z3de.fsf__46094.1501464278$1344841042$gmane$org@xmission.com>
References: <20120812145023.GA17077@localhost>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20120812145023.GA17077@localhost> (Fengguang Wu's message of
	"Sun, 12 Aug 2012 22:50:23 +0800")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, kernel-janitors@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Fengguang Wu <fengguang.wu@intel.com> writes:

> Hi Geert,
>
> This is the build error I get, on Eric's userns tree.
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git userns-always-map-user-v45
> head:   38a0b1b84f5f613ff4e01fffda27f87d4cb2b649
> commit: 5ea9fc30545b658380d4794340227fe821b83701 [80/99] vfs: Add setns support for the mount namespace
> config: m68k-m5475evb_defconfig (attached as .config)
>
> All related error/warning messages:
>
> fs/namespace.c:2290:1: error: unknown type name 'atomic64_t'
> fs/namespace.c:2290:1: error: implicit declaration of function 'ATOMIC64_INIT' [-Werror=implicit-function-declaration]
> fs/namespace.c:2290:1: error: initializer element is not constant
> fs/namespace.c: In function 'alloc_mnt_ns':
> fs/namespace.c:2299:2: error: implicit declaration of function 'atomic64_add_return' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors

Fengguang is m68k the only place you are seeing build failures?

Exactly how I get a 64bit counter in that code path is not terribly
important.  I picked an atomic64_t because it looked simple and cheap.

If this is limited to a couple of m68k sub-arches I will let you guys
finish fixing this up so people can depend on atomic64_t being
available.  Otherwise it probably makes sense to go to with a different
abstraction.

> vim +2290 fs/namespace.c
>   2287	 * number incrementing at 10Ghz will take 12,427 years to wrap which
>   2288	 * is effectively never, so we can ignore the possibility.
>   2289	 */
>> 2290	static atomic64_t mnt_ns_seq = ATOMIC64_INIT(1);
>   2291	
>   2292	static struct mnt_namespace *alloc_mnt_ns(void)
>   2293	{
>
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
