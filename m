Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54CEC43334
	for <linux-m68k@archiver.kernel.org>; Mon, 25 Jul 2022 23:03:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236967AbiGYXDa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 25 Jul 2022 19:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbiGYXD3 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 25 Jul 2022 19:03:29 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E0FE248EB
        for <linux-m68k@vger.kernel.org>; Mon, 25 Jul 2022 16:03:29 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id y15so11728777plp.10
        for <linux-m68k@vger.kernel.org>; Mon, 25 Jul 2022 16:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=36JOAjybUSod044G0QfI5n3jIsSoBN97E8qwTQreEjA=;
        b=UHY+jHPHHlr2yw9V7UVU1z0upDvKrEIaSQzpa4gcRN0eAea7jTWN3MDSek/qu+iIKT
         04KvwN9Nqh1UMmMCTrnP0BKdxy0cJGAjp65nLuJEj85DGBDgGYVYFf2ipxG9CGIR5c6d
         guBxCpSr7sbPZz2cPCev/OTJaDcL+yfAp8Pt+ucL17yjndPHyg1DXDDzVHXRu6qRvF/J
         VS1iBKXGsyFAFlY1IZFZfwhlYGaUPVX+gOuaXhTdN/V6Ulj39IXdVX3zcqU+vdOsg50o
         iTvWkfOvvqdIgf9BTadPi9MebSXiQsZXfBZtSKojTo1d5Ocu7RniqOdYGAgcFjKrutrq
         zViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=36JOAjybUSod044G0QfI5n3jIsSoBN97E8qwTQreEjA=;
        b=rErCZ7XWFvmOseHQ4m+Hg2diqC13/D7VU2sZrQHADJ4XIhncAE34hvm7v/GNAPl9C/
         gyqxi6JXCnk4sQ+DL34l8D66p+kQroUBtXnKTTKAYySo0HEKlHgb9bIsrXeg9oNvhuCJ
         zM+ZoBLxZ0qPsKqDry5V7kxe5U29uXVjfzt6Knp9A6EkZAZBGbw8yfvOMX6GNHjJCi8b
         5k1vgQeoPpyc2zd5iC/1gMd8v9YYDc7JnGTGFtf4tHcWwgOKuvBC2GoPAdukkgFCvbgK
         UJUFZAtTtj37Z0cCIlxQGceH6c2u7o52BhzMdW1xY2JXF9nnnVmHbbolvZs1gqbLGXKE
         DCtA==
X-Gm-Message-State: AJIora+1U7M2k6x8f0JL6UHAfljR40+NlsUnhh3Ziv82pLrbIh3etjCm
        sxWGgZtQ6pE4gxGt0r9IaMWrNA==
X-Google-Smtp-Source: AGRyM1ueCZKXhVMNIQiBakAJ1qIntesYP3rgTNvkT7KMjfdGpaTs03KnhCfzLI2+hs3CO56NJtAyhQ==
X-Received: by 2002:a17:902:b198:b0:16c:1c13:cd8d with SMTP id s24-20020a170902b19800b0016c1c13cd8dmr14000111plr.92.1658790208572;
        Mon, 25 Jul 2022 16:03:28 -0700 (PDT)
Received: from [192.168.1.100] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d2c100b0016a565f3f34sm9888467plc.168.2022.07.25.16.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 16:03:27 -0700 (PDT)
Message-ID: <5e45c2a8-b35e-9a15-18e6-2e3a7ad00f5f@kernel.dk>
Date:   Mon, 25 Jul 2022 17:03:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7 2/2] block: add overflow checks for Amiga partition
 support
Content-Language: en-US
To:     Martin Steigerwald <martin@lichtvoll.de>,
        linux-block@vger.kernel.org, Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
References: <1539570747-19906-1-git-send-email-schmitzmic@gmail.com>
 <1539570747-19906-3-git-send-email-schmitzmic@gmail.com>
 <2265295.ElGaqSPkdT@ananda>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <2265295.ElGaqSPkdT@ananda>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 7/25/22 6:36 AM, Martin Steigerwald wrote:
> Michael Schmitz - 15.10.18, 04:32:27 CEST:
>> The Amiga partition parser module uses signed int for partition sector
>> address and count, which will overflow for disks larger than 1 TB.
> 
> Did this go in? I did not find anything in git log. I wonder whether I 
> can close the bug report mentioned below.

Looking at the history (2018!), doesn't like they ever got reviewed or
went upstream. Looks like they are still needed, however they no longer
apply as-is.

-- 
Jens Axboe

