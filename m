Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E3AC433F5
	for <linux-m68k@archiver.kernel.org>; Fri, 17 Sep 2021 05:41:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CA6661019
	for <linux-m68k@archiver.kernel.org>; Fri, 17 Sep 2021 05:41:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244918AbhIQFnN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 17 Sep 2021 01:43:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237123AbhIQFnM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 17 Sep 2021 01:43:12 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A1FC061574
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Sep 2021 22:41:51 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id j1so6186411pjv.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Sep 2021 22:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=GJ9GNcvTF5bQrag4lvZ9nDs0rms6YfIHTJPNJBGmFcs=;
        b=ew/8qxnRfkzcyLK4G01net2yJZZoYbvxahVi6MA0LqqvPPLeW4ZHP4e+ysVQFIkhmW
         6HlzqedxzecEg/GBPXkGLNWo+aSm3Y1uHumE5TlQdBuJiWbHvMWMbXsQPd0IYooioV5P
         g04cScAduudFINrQXt0v4rJRnkGkHjmBNQYJox4/ZButgaaMEbmzmNZQnCc51Db/BTh6
         wM9Lvn1St19XIHVb9+QjphngMU/LWwxZRvMTQZFI6Kg/9I4tEl0gN7Zv2d5iff1EXjWG
         A+zJDBqKr2pg4wzHnMg0t62hXDgyx5Xhj/0EeRZMAOG3wnlv2TRUke2kauEjm+q0zkwY
         kUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=GJ9GNcvTF5bQrag4lvZ9nDs0rms6YfIHTJPNJBGmFcs=;
        b=eb1DMcSUNRXJYLTFIrRSsyDjhvd2P1FXQK2gb4r2Svm5ssTXLiI2y6dctly/Ygh79o
         AC/gQY1ADdMmF1Fip5BlbC5j9d3zOXjL09dePy+lkdlZJC7WwCDkQztTUxxGEFOkcTNU
         xuKQS9ELRpEE9lJYnuO+lOLyVQIttpoAj/Ex4vQOzxksVuYHX4mxa51tqmkffHQK/Wcy
         nX6SdGWW+KmFLvDF9cJN+sdS6/xFpGZlKfUfajXLZkMo0fbyXuPsDUfs1ys/NDO7Nmk/
         6UQHaErVnDqkkB+XaXDdn5gNHmGLYvubJOWkf7MxropxCcgV1YvoyA5Wr8DoKaElsAzW
         Uwrw==
X-Gm-Message-State: AOAM531+3Xf1ylWKLqhfp6iVonk72g/aIigCdevMYuT1CX+W6vhIkgCZ
        Ebq8VlG4FWXOY7kk6tEv+VyxjCWWelY=
X-Google-Smtp-Source: ABdhPJxTL+FreHOqod3kVyNmddQUGuEIo93P2sUMH0gXZIYpounwisDI8nzu19sXxvDKtcsOD5eU+Q==
X-Received: by 2002:a17:90a:5d95:: with SMTP id t21mr10255137pji.77.1631857310457;
        Thu, 16 Sep 2021 22:41:50 -0700 (PDT)
Received: from [10.1.1.26] (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.gmail.com with ESMTPSA id u6sm4780753pgr.3.2021.09.16.22.41.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Sep 2021 22:41:50 -0700 (PDT)
Subject: Re: remove set_fs for m68k
To:     Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
References: <20210916070405.52750-1-hch@lst.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <1fc48604-f6e3-cfc2-93a5-94addd9c64f2@gmail.com>
Date:   Fri, 17 Sep 2021 17:40:00 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20210916070405.52750-1-hch@lst.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

For the entire series:

Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
Tested-by: Michael Schmitz <schmitzmic@gmail.com>

(on 030)

Cheers,

	Michael


On 16/09/21 19:03, Christoph Hellwig wrote:
> Hi all,
>
> this series converts m68k to the new world where set_fs is gone to make
> the uaccess routines work on kernel pointers.
>
> Changes from the RFC version:
>   - simplify virt_to_phys_slow (and thus flush_icache_range)
>
