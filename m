Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB623C43334
	for <linux-m68k@archiver.kernel.org>; Thu,  9 Jun 2022 23:45:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345559AbiFIXpc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 9 Jun 2022 19:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232670AbiFIXp3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 9 Jun 2022 19:45:29 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB483A198
        for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jun 2022 16:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654818328; x=1686354328;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/qix89+4Yux2UyS3QMBWmKLCne+VvkXES21cCGFIhLs=;
  b=MWl3HhnyJ9UEB83mYA/YVCqpO0vesSiLvSwZPPwapE7eFEOtX8ZLzxec
   XZD9UANkK/5LYR1Yul3AWmO507MGLVXUbecEU4mgghPr4Ejr061llg9XS
   SjCx7t+CzIN7gRCo2Ex90U9QbE+zZPiRnhMC2rqz4QykMq/GklnxRraQq
   GhXB3C5fdwaZVKMuSu4ltGxyvOJWHsYLtEvSKPALw123zbtzlxGwmon4b
   jfQXfAvy5Ajo/IuqF6UX+ZWOrnTGTWvQcCuLj/5+o/f++EqQ481YKoKo5
   9e35zIGYoj2KhZU7fInCZKq8bgJvdULmnxN9k3lDyWljtqH4RNMQRmOaJ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278598934"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="278598934"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 16:45:19 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="610480359"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.198.157])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 16:45:19 -0700
Date:   Thu, 9 Jun 2022 16:49:21 -0700
From:   Jacob Pan <jacob.jun.pan@linux.intel.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com,
        vgupta@kernel.org, linux@armlinux.org.uk,
        ulli.kroll@googlemail.com, linus.walleij@linaro.org,
        shawnguo@kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        tony@atomide.com, khilman@kernel.org, catalin.marinas@arm.com,
        will@kernel.org, guoren@kernel.org, bcain@quicinc.com,
        chenhuacai@kernel.org, kernel@xen0n.name, geert@linux-m68k.org,
        sammy@sammy.net, monstr@monstr.eu, tsbogend@alpha.franken.de,
        dinguyen@kernel.org, jonas@southpole.se,
        stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, hca@linux.ibm.com, gor@linux.ibm.com,
        agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
        davem@davemloft.net, richard@nod.at,
        anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        acme@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        namhyung@kernel.org, jgross@suse.com, srivatsa@csail.mit.edu,
        amakhalov@vmware.com, pv-drivers@vmware.com,
        boris.ostrovsky@oracle.com, chris@zankel.net, jcmvbkbc@gmail.com,
        rafael@kernel.org, lenb@kernel.org, pavel@ucw.cz,
        gregkh@linuxfoundation.org, mturquette@baylibre.com,
        sboyd@kernel.org, daniel.lezcano@linaro.org, lpieralisi@kernel.org,
        sudeep.holla@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, anup@brainfault.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        Arnd Bergmann <arnd@arndb.de>, yury.norov@gmail.com,
        andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
        rostedt@goodmis.org, pmladek@suse.com, senozhatsky@chromium.org,
        john.ogness@linutronix.de, paulmck@kernel.org, frederic@kernel.org,
        quic_neeraju@quicinc.com, josh@joshtriplett.org,
        mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
        joel@joelfernandes.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        bsegall@google.com, mgorman@suse.de, bristot@redhat.com,
        vschneid@redhat.com, jpoimboe@kernel.org,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, linux-perf-users@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        xen-devel@lists.xenproject.org, linux-xtensa@linux-xtensa.org,
        linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arch@vger.kernel.org,
        rcu@vger.kernel.org, jacob.jun.pan@linux.intel.com
Subject: Re: [PATCH 04/36] cpuidle,intel_idle: Fix CPUIDLE_FLAG_IRQ_ENABLE
Message-ID: <20220609164921.5e61711d@jacob-builder>
In-Reply-To: <20220608144516.172460444@infradead.org>
References: <20220608142723.103523089@infradead.org>
        <20220608144516.172460444@infradead.org>
Organization: OTC
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Peter,

On Wed, 08 Jun 2022 16:27:27 +0200, Peter Zijlstra <peterz@infradead.org>
wrote:

> Commit c227233ad64c ("intel_idle: enable interrupts before C1 on
> Xeons") wrecked intel_idle in two ways:
> 
>  - must not have tracing in idle functions
>  - must return with IRQs disabled
> 
> Additionally, it added a branch for no good reason.
> 
> Fixes: c227233ad64c ("intel_idle: enable interrupts before C1 on Xeons")
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  drivers/idle/intel_idle.c |   48
> +++++++++++++++++++++++++++++++++++----------- 1 file changed, 37
> insertions(+), 11 deletions(-)
> 
> --- a/drivers/idle/intel_idle.c
> +++ b/drivers/idle/intel_idle.c
> @@ -129,21 +137,37 @@ static unsigned int mwait_substates __in
>   *
>   * Must be called under local_irq_disable().
>   */
nit: this comment is no long true, right?

> +
> -static __cpuidle int intel_idle(struct cpuidle_device *dev,
> -				struct cpuidle_driver *drv, int index)
> +static __always_inline int __intel_idle(struct cpuidle_device *dev,
> +					struct cpuidle_driver *drv, int
> index) {
>  	struct cpuidle_state *state = &drv->states[index];
>  	unsigned long eax = flg2MWAIT(state->flags);
>  	unsigned long ecx = 1; /* break on interrupt flag */
>  
> -	if (state->flags & CPUIDLE_FLAG_IRQ_ENABLE)
> -		local_irq_enable();
> -
>  	mwait_idle_with_hints(eax, ecx);
>  
>  	return index;
>  }
>  
> +static __cpuidle int intel_idle(struct cpuidle_device *dev,
> +				struct cpuidle_driver *drv, int index)
> +{
> +	return __intel_idle(dev, drv, index);
> +}
> +
> +static __cpuidle int intel_idle_irq(struct cpuidle_device *dev,
> +				    struct cpuidle_driver *drv, int
> index) +{
> +	int ret;
> +
> +	raw_local_irq_enable();
> +	ret = __intel_idle(dev, drv, index);
> +	raw_local_irq_disable();
> +
> +	return ret;
> +}
> +
>  /**
>   * intel_idle_s2idle - Ask the processor to enter the given idle state.
>   * @dev: cpuidle device of the target CPU.
> @@ -1801,6 +1824,9 @@ static void __init intel_idle_init_cstat
>  		/* Structure copy. */
>  		drv->states[drv->state_count] =
> cpuidle_state_table[cstate]; 
> +		if (cpuidle_state_table[cstate].flags &
> CPUIDLE_FLAG_IRQ_ENABLE)
> +			drv->states[drv->state_count].enter =
> intel_idle_irq; +
>  		if ((disabled_states_mask & BIT(drv->state_count)) ||
>  		    ((icpu->use_acpi || force_use_acpi) &&
>  		     intel_idle_off_by_default(mwait_hint) &&
> 
> 


Thanks,

Jacob
