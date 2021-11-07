Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 012BFC433FE
	for <linux-m68k@archiver.kernel.org>; Sun,  7 Nov 2021 17:33:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDB0B6139E
	for <linux-m68k@archiver.kernel.org>; Sun,  7 Nov 2021 17:33:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235979AbhKGRfu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 7 Nov 2021 12:35:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235390AbhKGRfr (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 7 Nov 2021 12:35:47 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3900C061570
        for <linux-m68k@lists.linux-m68k.org>; Sun,  7 Nov 2021 09:33:04 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id s139so6825070oie.13
        for <linux-m68k@lists.linux-m68k.org>; Sun, 07 Nov 2021 09:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tMVMvSELY54S0UdLfdOcY9hXGDCgRpBmnCTKjFa8UlE=;
        b=QIfw+m72ItgaApqkAoLUYKEHkpy+eMpUCLymo2SVE2e06bxlhsvsGBIpx80FAFL6zX
         lQmhx5vWsnqdO5AzfRwzYmC9JyeI+x703tpvfwQKurLg2VtZOzsNtJVqgO0A8u3N2B9I
         BYJElUmFFKGlmNuNH1pVTHbG46IPWj2FGkpJks4IWHqhA3hkwgU7q4GC5oDjmilXskFD
         oTKdooszpWu854bZrRMH7UW0QrvSFFnK9cGOfGPg2b3g5hqd+nvAec6GccpfULS1MyoN
         kwidN5WRwT1FH2PsDPsfoM+Wt2eEwiLbpjLKm84c+sezJpyJvFv7kmoqDjei75CdMOoF
         bVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tMVMvSELY54S0UdLfdOcY9hXGDCgRpBmnCTKjFa8UlE=;
        b=I0TRxecG3QxPpJVPG4z6JsEsJjJea7lSDZv3qSqFUdx1VWTsefz0IUY82nJAh+kjnc
         4GfmLV6r+wogu/yqZWx0IgprxskRKP0V1TqAsm2JzIVmyvV4ZwNH5fD3xlCbW2bEolHE
         0bN8k9QS2Ya8zwoTEk15Ba7bzm0Uls0x+nt51P0r4WZIiF10Zh7mbnaGcI2LTcGaTnBV
         aeSLqlx8P+ZPekJaU5UxpiWbigrSqXYPUSCdIZLRHsxzHrmH5mk2Lwbk489sJhZoxneQ
         Ejlzh58BdMgRu6L1wIiG9k9hkBhahU6knn8nYYwuU0+KiktRR1iviIplyOOSxaFMgr9c
         5Dsw==
X-Gm-Message-State: AOAM5325k+h951th3ONm1fKMltX0M0MCJ/aDcbCySuE5V+TMDPfwU906
        cPnKRtlf+HRAW4DgUzAbCnE=
X-Google-Smtp-Source: ABdhPJygB0wkAZr+IyDwhIXD/1Ky9Z1d16PhZAI/x4npp+2qcv9Jc+QXaxpUDgRoNUJ2QI01eNmjeA==
X-Received: by 2002:aca:650d:: with SMTP id m13mr16262607oim.42.1636306383620;
        Sun, 07 Nov 2021 09:33:03 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c18sm4840649otr.32.2021.11.07.09.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Nov 2021 09:33:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Lee Jones <lee.jones@linaro.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>, Tony Lindgren <tony@atomide.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Pavel Machek <pavel@ucw.cz>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
        linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-28-digetx@gmail.com> <YYbqlmOM95q7Hbjo@latitude>
 <be0c74c6-05a9-cad5-c285-6626d05f8860@gmail.com>
 <9a22c22d-94b1-f519-27a2-ae0b8bbf6e99@roeck-us.net>
 <658cf796-e3b1-f816-1e15-9e9e08b8ade0@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 27/45] mfd: ntxec: Use devm_register_power_handler()
Message-ID: <5a17fee3-4214-c2b9-abc1-ab9d6071591b@roeck-us.net>
Date:   Sun, 7 Nov 2021 09:32:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <658cf796-e3b1-f816-1e15-9e9e08b8ade0@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 11/7/21 9:16 AM, Dmitry Osipenko wrote:
> 07.11.2021 20:08, Guenter Roeck пишет:
>> On 11/7/21 8:53 AM, Dmitry Osipenko wrote:
>>> 06.11.2021 23:54, Jonathan Neuschäfer пишет:
>>>> Hi,
>>>>
>>>> On Thu, Oct 28, 2021 at 12:16:57AM +0300, Dmitry Osipenko wrote:
>>>>> Use devm_register_power_handler() that replaces global pm_power_off
>>>>> variable and allows to register multiple power-off handlers. It also
>>>>> provides restart-handler support, i.e. all in one API.
>>>>>
>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>>> ---
>>>>
>>>> When I boot with (most of) this patchset applied, I get the warning at
>>>> kernel/reboot.c:187:
>>>>
>>>>      /*
>>>>       * Handler must have unique priority. Otherwise call order is
>>>>       * determined by registration order, which is unreliable.
>>>>       */
>>>>      WARN_ON(!atomic_notifier_has_unique_priority(&restart_handler_list,
>>>> nb));
>>>>
>>>> As the NTXEC driver doesn't specify a priority, I think this is an issue
>>>> to be fixed elsewhere.
>>>>
>>>> Other than that, it works and looks good, as far as I can tell.
>>>>
>>>>
>>>> For this patch:
>>>>
>>>> Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
>>>> Tested-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
>>>
>>> Thank you. You have conflicting restart handlers, apparently NTXEC
>>> driver should have higher priority than the watchdog driver. It should
>>> be a common problem for the watchdog drivers, I will lower watchdog's
>>> default priority to fix it.
>>>
>>
>> The watchdog subsystem already uses "0" as default priority, which was
>> intended as priority of last resort for restart handlers. I do not see
>> a reason to change that.
> 
> Right, I meant that watchdog drivers which use restart handler set the
> level to the default 128 [1]. Although, maybe it's a problem only for
> i.MX drivers in practice, I'll take a closer look at the other drivers.
> 

They don't have to do that. The default is priority 0. It is the decision
of the driver author to set the watchdog's restart priority. So it is wrong
to claim that this would be "a common problem for the watchdog drivers",
because it isn't. Presumably there was a reason for the driver author
to select the default priority of 128. If there is a platform which has
a better means to restart the system, it should select a priority of
129 or higher instead of affecting _all_ platforms using the imx watchdog
to reset the system.

Sure, you can negotiate that with the driver author, but the default should
really be to change the priority for less affected platforms.

Guenter
