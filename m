Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16337C43334
	for <linux-m68k@archiver.kernel.org>; Mon, 20 Jun 2022 19:21:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244534AbiFTTVU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 20 Jun 2022 15:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343589AbiFTTVR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 20 Jun 2022 15:21:17 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A4291BE8D
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Jun 2022 12:21:16 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id o9so7202863edt.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Jun 2022 12:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/0jxbATVEDKJnIt6ABi4UcKvefavHfALqV2faNdj1xk=;
        b=E2w9SsK622uI3mRxf9d1ClkzeccxGN5eH53Unw5M4E4b0/ciI8EdJTKHuIfMDb3oYJ
         YTDXeesnCEDlZdX1+VVgBVcyrcc1kjQhXUl7QhujJt1ZGMR2a7e0T1PcupO4HUGZdiFD
         39IpbFP7Xi0rCmSlptLDWbdMNNlf9hIPR48cNLSNpAavFS7XyQE1FOIVXFDngH7HEOLz
         EtQ6srucKJaxyDr+flGCni5+E4AlE5K+pYwH7NKtnjDBeQN4QNkmdg+EOpiVfF9aJDQD
         P0cQv8kp38qvfnww9Mbzg40KkFzsj1eem1AjDaHXAaN8ujWQnF1PUAt6Vyo1EdmDOpUI
         J49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/0jxbATVEDKJnIt6ABi4UcKvefavHfALqV2faNdj1xk=;
        b=acfC1UyNKaT4r87bB++wai+04lF59fHCpDyOM9SCav6v2knJeQGaIQv5Bs+ukyapPc
         ybbm1vOwjoPvFF+jmC4hIZRYMmzqUn+cX1kDijOdny0/7tf4/EFNyIyVEIl6U0Hz33AR
         D4Tx6jiIkG72mLPzNdvTUcWfPEexuXFHsYdlu8AuvQK4BW1jiJ/aQSHJi+9yIA0+99y5
         SMe3nRtAHwZoibwjI3Xd0inU21ASaJTAi8wJFCSoBnsUu04taWOZGVOF/wyPMPR04k95
         KhYBbZEQ7C5NGh85jZY2KsJ5ObIEurgWWuzweBMqhZl7deIgMPqWRy1aXetrHb5ruRbR
         q9yg==
X-Gm-Message-State: AJIora8KpdMONs+KeN8yIbYPSn0BDIebjCwH/zKNa+Hxypok9lSvfzAL
        9158L6pt7YAELs55yZodXuA=
X-Google-Smtp-Source: AGRyM1s7UDK4xMx70oMoQG8mkudNnGwBUAoUHsgJQ7yqWiUaYK2qbi0m7Q+0UFQ5sVxeWk33gHpWbA==
X-Received: by 2002:a05:6402:5418:b0:435:5a48:daa9 with SMTP id ev24-20020a056402541800b004355a48daa9mr25144978edb.304.1655752874902;
        Mon, 20 Jun 2022 12:21:14 -0700 (PDT)
Received: from mail (239.125-180-91.adsl-dyn.isp.belgacom.be. [91.180.125.239])
        by smtp.gmail.com with ESMTPSA id f23-20020a170906825700b0070ad296e4b0sm6388168ejx.186.2022.06.20.12.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 12:21:14 -0700 (PDT)
Date:   Mon, 20 Jun 2022 21:21:12 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Alexander Lobakin <alexandr.lobakin@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Yury Norov <yury.norov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matt Turner <mattst88@gmail.com>,
        Brian Cain <bcain@quicinc.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Marco Elver <elver@google.com>, Borislav Petkov <bp@suse.de>,
        Tony Luck <tony.luck@intel.com>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-alpha@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>
Subject: Re: [alobakin:bitops 3/7] block/elevator.c:222:9: sparse: sparse:
 cast from restricted req_flags_t
Message-ID: <20220620192112.ghyegqvtj3ud7zla@mail>
References: <202206191726.wq70mbMK-lkp@intel.com>
 <20220617144031.2549432-1-alexandr.lobakin@intel.com>
 <20220620135146.2628908-1-alexandr.lobakin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620135146.2628908-1-alexandr.lobakin@intel.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jun 20, 2022 at 03:51:46PM +0200, Alexander Lobakin wrote:
> From: kernel test robot <lkp@intel.com>
> Date: Sun, 19 Jun 2022 17:20:05 +0800
> 
> Also, could someone please help me with this? I don't get what went
> wrong with sparse, it's not even some new code, just moving old
> stuff.

Hi,

The first sparse's warnings (sparse: preprocessor token __ATOMIC_*) are already
fixed (and most probably, the bots have already taken the fix).
I'm working on the second ones (sparse: unreplaced symbol).

-- Luc (Sparse's maintainer)
