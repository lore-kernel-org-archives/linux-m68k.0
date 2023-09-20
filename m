Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCD6CE79AB
	for <linux-m68k@archiver.kernel.org>; Wed, 20 Sep 2023 07:29:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233728AbjITH3e (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 20 Sep 2023 03:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233600AbjITH3d (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 20 Sep 2023 03:29:33 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363C6C9
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Sep 2023 00:29:27 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-404314388ceso69459305e9.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Sep 2023 00:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695194965; x=1695799765; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9FUmFWGdaoCCAX+yBYd9oidTjhPdRU5Hczc1k2R6GM=;
        b=BjYUuINZ4NuhFjPeCTj+gT6sWOFgi2fOZIdiQ9l2VdVGOZfdYh4U8xonUlHxtv/qyZ
         NttG2qCvxRg5ma77ml0yC7ICDO1y092ti/Jyy9gp/h06nJyGD1MBJpHCJCLrpvLPU1K5
         WLgRgzAwtOETrf9tuRPRzhkkOogcFBPwntGgAWTb29ET8OOPkop0LzbW3tCn0OACxxNt
         8rOjhkD/vHF7OJ9vU23jWILQECa2+vyqR41asykEZkR1ANlBMZP6ADD58+R8cPxQFBDW
         QnmJOafTKe4QIlVptPygjn29vyFDzAQKdYZ1Nz+0S0AqElJCqTFn5GYVtVNUSV6TSZ4T
         415Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695194965; x=1695799765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9FUmFWGdaoCCAX+yBYd9oidTjhPdRU5Hczc1k2R6GM=;
        b=L1cXh3j1USGgEuSZDicUUurWMLcM4ZaXSj9GNpTnEzRg1caKqtFg9WZNHxFKAiL711
         4nAvjhD7ZxIixrnDxvT+eGT7c4mXbSJgwWRg0XPNd2nB4l1wE236/wHukh+f5J4D6peR
         twxKI5lsMoXZuzc4eo1oYvOQqg/hTehGUlkJjJ9TB/PzuzdEZ3DnapD6UwMMF8GRIZGM
         VVBeL7DJ6Jr+dBQ1pk7i9ISfXig92Xri2fw0D0TxyLtgtc4SM9/nYdhwWQz9VCIjRsJW
         gheVR7QhM/G7S4fa34C4s3cj9iwz+j+5Br3E9iX3lCjryx3o6GXCjCOsc9UTBAtFsTA+
         fgjg==
X-Gm-Message-State: AOJu0Yzr8X0KJA/2ayAPOfUlTbcM1lBwMTzwr09rStw0gZRWLlH48083
        Nslr5u9+3EUXw8OGPVQhNYA=
X-Google-Smtp-Source: AGHT+IEpVnT/Cd2oEohbdKSMFoVqTb9dtDqJrcJ42h6au+YxgKEXvw3MWUudbGLbWXtUB4DWJ+z6pA==
X-Received: by 2002:a05:600c:152:b0:404:2dbb:8943 with SMTP id w18-20020a05600c015200b004042dbb8943mr1805727wmm.2.1695194965229;
        Wed, 20 Sep 2023 00:29:25 -0700 (PDT)
Received: from gmail.com (1F2EF265.nat.pool.telekom.hu. [31.46.242.101])
        by smtp.gmail.com with ESMTPSA id t19-20020a7bc3d3000000b003fefca26c72sm1136535wmj.23.2023.09.20.00.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 00:29:24 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date:   Wed, 20 Sep 2023 09:29:21 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
        Ankur Arora <ankur.a.arora@oracle.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        akpm@linux-foundation.org, luto@kernel.org, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, mgorman@suse.de,
        rostedt@goodmis.org, jon.grimm@amd.com, bharata@amd.com,
        raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com, jgross@suse.com, andrew.cooper3@citrix.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-um@lists.infradead.org, Brian Cain <bcain@quicinc.com>,
        linux-hexagon@vger.kernel.org,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Subject: Re: Arches that don't support PREEMPT
Message-ID: <ZQqfURDGaXQdTzZS@gmail.com>
References: <20230912082606.GB35261@noisy.programming.kicks-ass.net>
 <87cyyfxd4k.ffs@tglx>
 <CAHk-=whnwC01m_1f-gaM1xbvvwzwTiKitrWniA-ChZv+bM03dg@mail.gmail.com>
 <87led2wdj0.ffs@tglx>
 <ZQmbhoQIINs8rLHp@casper.infradead.org>
 <0e69f7df80dc5878071deb0d80938138d19de1d1.camel@physik.fu-berlin.de>
 <20230919134218.GA39281@noisy.programming.kicks-ass.net>
 <a6c84803274116ec827cd4bdd4e72a8d0c304c27.camel@physik.fu-berlin.de>
 <CAHk-=wgUimqtF7PqFfRw4Ju5H1KYkp6+8F=hBz7amGQ8GaGKkA@mail.gmail.com>
 <87pm2eui95.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pm2eui95.ffs@tglx>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


* Thomas Gleixner <tglx@linutronix.de> wrote:

> On Tue, Sep 19 2023 at 10:25, Linus Torvalds wrote:
> > On Tue, 19 Sept 2023 at 06:48, John Paul Adrian Glaubitz
> > <glaubitz@physik.fu-berlin.de> wrote:
> >>
> >> As Geert poined out, I'm not seeing anything particular problematic with the
> >> architectures lacking CONFIG_PREEMPT at the moment. This seems to be more
> >> something about organizing KConfig files.
> >
> > It can definitely be problematic.
> >
> > Not the Kconfig file part, and not the preempt count part itself.
> >
> > But the fact that it has never been used and tested means that there
> > might be tons of "this architecture code knows it's not preemptible,
> > because this architecture doesn't support preemption".
> >
> > So you may have basic architecture code that simply doesn't have the
> > "preempt_disable()/enable()" pairs that it needs.
> >
> > PeterZ mentioned the generic entry code, which does this for the entry
> > path. But it actually goes much deeper: just do a
> >
> >     git grep preempt_disable arch/x86/kernel
> >
> > and then do the same for some other architectures.
> >
> > Looking at alpha, for example, there *are* hits for it, so at least
> > some of the code there clearly *tries* to do it. But does it cover all
> > the required parts? If it's never been tested, I'd be surprised if
> > it's all just ready to go.
> >
> > I do think we'd need to basically continue to support ARCH_NO_PREEMPT
> > - and such architectures migth end up with the worst-cast latencies of
> > only scheduling at return to user space.
> 
> The only thing these architectures should gain is the preempt counter 
> itself, [...]

And if any of these machines are still used, there's the small benefit of 
preempt_count increasing debuggability of scheduling in supposedly 
preempt-off sections that were ignored silently previously, as most of 
these architectures do not even enable CONFIG_DEBUG_ATOMIC_SLEEP=y in their 
defconfigs:

  $ for ARCH in alpha hexagon m68k um; do git grep DEBUG_ATOMIC_SLEEP arch/$ARCH; done
  $

Plus the efficiency of CONFIG_DEBUG_ATOMIC_SLEEP=y is much reduced on 
non-PREEMPT kernels to begin with: it will basically only detect scheduling 
in hardirqs-off critical sections.

So IMHO there's a distinct debuggability & robustness plus in enabling the 
preemption count on all architectures, even if they don't or cannot use the 
rescheduling points.

> [...] but yes the extra preemption points are not mandatory to have, i.e. 
> we simply do not enable them for the nostalgia club.
> 
> The removal of cond_resched() might cause latencies, but then I doubt 
> that these museus pieces are used for real work :)

I'm not sure we should initially remove *explicit* legacy cond_resched() 
points, except from high-freq paths where they hurt - and of course remove 
them from might_sleep().

Thanks,

	Ingo
