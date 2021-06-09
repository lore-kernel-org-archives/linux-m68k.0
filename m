Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0702BC48BD1
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Jun 2021 10:53:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5DCA6139A
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Jun 2021 10:53:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237080AbhFIKzv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 9 Jun 2021 06:55:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40467 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237083AbhFIKzl (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 9 Jun 2021 06:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623236027;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JBWPCdmnHsH7qQGe81DFl3a6ru5xcOhjproglm1WObM=;
        b=QwJC1ngmrfl3sXAyqcrsZkAJM99ohcRxRDGQleZHVOe0QHkYHaLEtaCAAJ18apqDQzAeTB
        ATFOm9v/nG3u4aAaOUZq6bxxP9i5dTJ63OKEuU5isVlfC7tS5vpOtkRnkcTvWp8KauoKGh
        t97ao11Pq+vy55nVK0dhgiHxIn+K/wE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-MbJJcUVmMlWTFEBeqewRvg-1; Wed, 09 Jun 2021 06:53:43 -0400
X-MC-Unique: MbJJcUVmMlWTFEBeqewRvg-1
Received: by mail-wr1-f71.google.com with SMTP id k25-20020a5d52590000b0290114dee5b660so10619003wrc.16
        for <linux-m68k@lists.linux-m68k.org>; Wed, 09 Jun 2021 03:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=JBWPCdmnHsH7qQGe81DFl3a6ru5xcOhjproglm1WObM=;
        b=c9RGCLHZG+g8qZyEvBIvnBWfwSYo68kna3feScNsYtQSLzhP7wOigsLzGfrfOGfza7
         d1Kl32hlf1X3cLuamAVq63h0Ht9S/87rZnxrqMEKcd4GfFM1OQlDLk2KRF8FPVxnRfIr
         BtgZRTCfsqiwxveJ4acL1LnKUBnEYepMDosASDUqMB48zke9FIFbr72jUmVgdsPLq3QC
         MWWwiWapwYQff/RhCcAHEGbpyecCoc1UePr2+Hnxt2wKRe1qHu0VSrluUUvEXVVnDDM2
         YLSAzWrTOlVyGBDH7xAuMUP61cOL2lE6824m1rpIsw2CTWQ1ntp8piauxCTOCshZZmCi
         4VFQ==
X-Gm-Message-State: AOAM532g0RaLsGbfTzsnn/89XBbGptGDr1hJwgsP8EG1wECQCh2w6OWl
        FeHduKRD34/VHMCbyy9lg6WwKIE4WP3DyhZLkggR2jrEvBU7lZihTHMQm/2arkuapZr4Mzkn11M
        AOzSHQFnxoeziNJNdQaoB1xl7C0Oi
X-Received: by 2002:a05:600c:b50:: with SMTP id k16mr26766707wmr.137.1623236022753;
        Wed, 09 Jun 2021 03:53:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytaUEoH1yZlmOCQRNfd+wo+CI/GKYwuDVo1xp/A/CuJsfRh3qeLKHuz3pPcIzWarSKIwDzSA==
X-Received: by 2002:a05:600c:b50:: with SMTP id k16mr26766696wmr.137.1623236022628;
        Wed, 09 Jun 2021 03:53:42 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c611d.dip0.t-ipconnect.de. [91.12.97.29])
        by smtp.gmail.com with ESMTPSA id v15sm1695174wrw.24.2021.06.09.03.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 03:53:42 -0700 (PDT)
Subject: Re: [PATCH 3/9] arc: remove support for DISCONTIGMEM
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Jonathan Corbet <corbet@lwn.net>,
        Matt Turner <mattst88@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Richard Henderson <rth@twiddle.net>,
        Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
        linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
References: <20210602105348.13387-1-rppt@kernel.org>
 <20210602105348.13387-4-rppt@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <e9ef94f5-02bc-920b-9e6a-2d234e5bbbc5@redhat.com>
Date:   Wed, 9 Jun 2021 12:53:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602105348.13387-4-rppt@kernel.org>
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 02.06.21 12:53, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> DISCONTIGMEM was replaced by FLATMEM with freeing of the unused memory map
> in v5.11.
> 
> Remove the support for DISCONTIGMEM entirely.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

