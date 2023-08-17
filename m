Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4CDEC64EAE
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Aug 2023 21:30:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245409AbjHQVaT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 17 Aug 2023 17:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355384AbjHQV3x (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Aug 2023 17:29:53 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C1E4E4F
        for <linux-m68k@vger.kernel.org>; Thu, 17 Aug 2023 14:29:51 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bdcb800594so2307445ad.1
        for <linux-m68k@vger.kernel.org>; Thu, 17 Aug 2023 14:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692307791; x=1692912591;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UMvsQj0AyN2YxGfulewxUp8FE/IyigM8mclKSBkMesk=;
        b=FEC2VVv0D9tO+CCEQvBnsfYFH8qqxNKSPrHagvcHB+LoibyxUzHRdER7iNrvDZY+H/
         kargq35W074qz5B0GqvdvF3/J92Apwuu7OMYrkY1VcQeklM5vRGnWlb+1wi4Ictk/qf6
         olf5HC7se9xfwBdoE3W8hFLphVPOx9rwRoq8XXaOAdaSUx4U+NLpkg9MYcdr/jCmhMLX
         9uj1b2d7xedW3hv4E1nj5qKnVc1KrUML0RskSGf7arbi5XT2YNDMbq3GrE2YiZfbQydj
         07IbCV+AHkTgnMptDLrFiTaAudlTfgvsmDg8Gb6KhWSg50h9CS6/LrlATgyA6BgGWXG8
         QTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692307791; x=1692912591;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UMvsQj0AyN2YxGfulewxUp8FE/IyigM8mclKSBkMesk=;
        b=bSloYOdgLyq3ni5DbGHJdhpED5Erj9xzRap5DO4OmE21mwblvKrPuoylr//slIQ3fm
         pekQm6QW5vN5zLkqKf0b7oTKkWv4q7et3/380uYOnaPCJiC4RixyGW7Pq9Sgi++d5y/s
         Gz4WjyvbjhSPJDsVCDp7Eqz2g7juGCwGjuG3tgurRXqxAkSDCFIRqvVECqOFhZDLDfPZ
         tcIiTP1n0vcaYAOpqivmEHlRNDG2A5+7CQh6rz+w9roIrwveLbw8TV08V8zvBtCv3tCJ
         4cYzB9Szqbzk3VMq8/Vis0EXlEpBlK1C9VhZUK2MmlY1UVYvUFdrxbI+yvKlMzJNl6l2
         e3Iw==
X-Gm-Message-State: AOJu0YxgOEFMR/PkgjSXADXa17nzk/07p7oA4WwWKTqpGku6OuvC9cuh
        d2nyrSedAi9xtsavhGxXazu6tiaU8hE=
X-Google-Smtp-Source: AGHT+IFcbgXGpAcFtUNpjiCGN1MYd8UZ3Ko/SElF1960NKTfJ7QK7iusXT3zmSIWMgVTLTW+Rv/X3A==
X-Received: by 2002:a17:903:124e:b0:1b8:6cae:4400 with SMTP id u14-20020a170903124e00b001b86cae4400mr824186plh.37.1692307790958;
        Thu, 17 Aug 2023 14:29:50 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:e51d:7e20:1b6c:6331? ([2001:df0:0:200c:e51d:7e20:1b6c:6331])
        by smtp.gmail.com with ESMTPSA id t7-20020a170902e84700b001befac3b3cbsm215943plg.290.2023.08.17.14.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 14:29:50 -0700 (PDT)
Message-ID: <078be00d-cf5d-debe-1886-7cd7476fff08@gmail.com>
Date:   Fri, 18 Aug 2023 09:29:46 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v3 0/2] Q40 IDE fixes
Content-Language: en-US
To:     William R Sowerbutts <will@sowerbutts.com>
Cc:     linux-m68k@vger.kernel.org, rz@linux-m68k.org, geert@linux-m68k.org
References: <20230817035001.8400-1-schmitzmic@gmail.com>
 <ZN3mT14FzfbhKYt5@sowerbutts.com> <ZN6CNBBSCvFwc9Z9@sowerbutts.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <ZN6CNBBSCvFwc9Z9@sowerbutts.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi William,

On 18/08/23 08:25, William R Sowerbutts wrote:
> On Thu, Aug 17, 2023 at 10:20:15AM +0100, William R Sowerbutts wrote:
>> I'll test this evening and report back.
> The patches work.

Thanks for testing - I'll get this series off to linux-ide now.

Cheers,

     Michael

>
> Thanks
>
> Will
>
> _________________________________________________________________________
> William R Sowerbutts                                  will@sowerbutts.com
> "Carpe post meridiem"                               http://sowerbutts.com
>           main(){char*s=">#=0> ^#X@#@^7=",c=0,m;for(;c<15;c++)for
>           (m=-1;m<7;putchar(m++/6&c%3/2?10:s[c]-31&1<<m?42:32));}
>
