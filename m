Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7329C77B75
	for <linux-m68k@archiver.kernel.org>; Fri,  5 May 2023 05:05:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbjEEFFM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 5 May 2023 01:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbjEEFFL (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 5 May 2023 01:05:11 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE71B93E8
        for <linux-m68k@lists.linux-m68k.org>; Thu,  4 May 2023 22:05:10 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-517c840f181so647433a12.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 04 May 2023 22:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683263110; x=1685855110;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bor6uhAtayZ8QB/La7DzLrGgkgQ7r/5nuuqV3iNy16c=;
        b=VyOlLaIqUj3iZOoyHiXlHKiVMEDNhH/kOImVNuMjO9PGffGVCj/dK52tcQqNiFYdEr
         E0OGsjdbbvywfc7Xv+xJhkRxS2AIoNMJkSKQBcdgRzLM3QrpdQ2WZvsQ259ob/4BVbJx
         DaVJBJYC2fIQamZQw/PTbNFyfDLaVTaYWFbqxFEdyOeEZzqEzdHWWBs+p9zmUikBt34w
         YFhaQor+iEeyitZECca+mtrJyUdn/uqObML/5c1RiJ8Y/9q9SzmH+ZK0ZEd1k5LoZaRv
         RywrfFrbJ0ujJOfDgr+yKMm01DYiDJ9s2z2+xeJ4JoAF0NzHGo0SGuO0JlFW+0/hby1J
         8ZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683263110; x=1685855110;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bor6uhAtayZ8QB/La7DzLrGgkgQ7r/5nuuqV3iNy16c=;
        b=AYjRdAP8AIIdBiaIpWyp2NesQ8b6LZjhJdkKRjSPNHgcidOgaNgN9oSay6LZUdp4WP
         gtvALf9Do3Df2MqcY4oGBLk/3V60Z3rbMIYm6r0pAYfMpCuoLC65H9xlQDRA6CEdDpSW
         Nq/WBR6+RfeieKCLvTc3XlmGW09Z+R53QrYCJjJWJi6o6oJ3gOj0qZf0pgMsbWK33xkz
         6gKdZLZicsH4g+ZRxY2gRluZSCO8oTUbX4TW0vcQQk3YalQsxvZLYjQZWguXTJGelYwV
         zPlO3GNEfUQj/W8wC88axnbZakieD8MA2ohuAe9DcGtXKQ7SP8x7JfOOZHZmHe5ULs/B
         UqMg==
X-Gm-Message-State: AC+VfDzP/tiCTTCI7wb2A4+pjkDtJNaRC+N6DbvueVNWboFbL4f1sM05
        M5WHR0G6ZVuRvhPCN3z9OxolPw8R9zs=
X-Google-Smtp-Source: ACHHUZ5ql8yLpB7t4JSN6zK+z/bfoOX1L9GZbSfegLZRQBsmgqQoOCJXXDZPXrhgSZGwehPUkOzsLA==
X-Received: by 2002:a05:6a20:3d21:b0:ef:e440:8aac with SMTP id y33-20020a056a203d2100b000efe4408aacmr276906pzi.39.1683263109970;
        Thu, 04 May 2023 22:05:09 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id k25-20020aa792d9000000b00636c4bd7c8bsm644404pfa.43.2023.05.04.22.05.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 May 2023 22:05:09 -0700 (PDT)
Subject: Re: [PATCH RFC 2/2] m68k: Make allowance for signal delivery
 following an address error
To:     Finn Thain <fthain@linux-m68k.org>
References: <cover.1683010227.git.fthain@linux-m68k.org>
 <f94a7736c10bc4f256bef5b826419faacb297f4a.1683010227.git.fthain@linux-m68k.org>
 <f4280683-9044-3858-3262-16080e584c96@gmail.com>
 <421fd88f-1c91-8fb9-98a8-6ac3974bd9c9@linux-m68k.org>
 <268271f3-7d2c-bb2f-f0e4-b26bc80ac015@gmail.com>
 <79fa24d5-ab04-0750-5dd4-eae6db212a71@linux-m68k.org>
 <c4ed63f4-6aea-2a1c-56b4-80fd64274cef@gmail.com>
 <b57967eb-8021-a4c3-9171-973252529194@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Andreas Schwab <schwab@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <4e20d336-1215-bf66-14b1-a142a2960d70@gmail.com>
Date:   Fri, 5 May 2023 17:05:03 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <b57967eb-8021-a4c3-9171-973252529194@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 05.05.2023 um 15:14 schrieb Finn Thain:
> On Fri, 5 May 2023, Michael Schmitz wrote:
>
>>
>> In terms of fixing the bus error bug, I think we'll need to fix this
>> regression first (only first patch of yours applied):
>>
>
> That patch came from Andreas, maybe he can comment.
>
>> I'll try with your second patch applied as well.
>
> I think patch 2/2 should be tested alone since 1/2 was nak'd.

I'm trying to find out whether patch 2 mitigates the effect of patch 1. 
But I'll test patch 2 alone as well. No worries.

Cheers,

	Michael


