Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F10FECDB476
	for <linux-m68k@archiver.kernel.org>; Wed, 11 Oct 2023 18:22:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233055AbjJKSWM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 11 Oct 2023 14:22:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233189AbjJKSWM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 11 Oct 2023 14:22:12 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1067A9E
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Oct 2023 11:22:06 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2773f776f49so51310a91.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Oct 2023 11:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697048525; x=1697653325; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6hN3Y1Gx/7diunP62IVxUnXD4EF9Jlv9k/rCp+joDrQ=;
        b=F07B/0VWkDs1nshZYubO608+WxcAyxifSbpMnbN9rKptsZmiPLI5aqbbfo3/fdELUc
         id6QCUZNQVPMGtGsrsoeybDKVsdforqmElVy9qj1g3HGzusHqK1lVDx7HsIDf7aBcXEN
         fhRSecY5M+4/cyy8JRsWgMnY2ig5ZqSz5+dXbtmk5jMVpgk4v8J8O9SKf+fX5W4OQVrn
         RGyME98vANhYb9WHWWfOYG5c5j36vL1Z7xlPAJ/4WlTGdfhlNsYbt0ttv5/IkzJnlI+p
         5QzXs8zOFq4o1/xjGHiWrvdiXFDkcKxPDtzFCHeUwA3wgGwalAcTT3o1qTLfywkojPlK
         2/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697048525; x=1697653325;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6hN3Y1Gx/7diunP62IVxUnXD4EF9Jlv9k/rCp+joDrQ=;
        b=Gao4OiGuoYD+4N/xpo2iHcvQZfx2QnbWwPZfPyAh3cyuCgg+lYe0DlWJVVXacua/lg
         6MxyxNxgHua7rab97RgieAwIaxv6ccwvpMCCttGLThwplcfrgHr3+mHwOZAYFE3Zr9qS
         xAd2oQBnwY+561r+BFqMAQoFjOqihCLkWynJza6jdStABcG3aqZOqCXXaf/YWmy+bVnV
         LJrRCYLz0mebOeaobTc1WRB59M7fq5ggo3TJKgt13qeIawhO54l1XeET/mCAYoW9CvRP
         wpGi+X3bxAmgxANqWs0QzzhUw1BilByvtoE+eDmoFsGSr8bWtXWdZZsezcTdywdNLhQg
         hHLg==
X-Gm-Message-State: AOJu0YyYqOpWndJNZxZWNnsYbiPPQ1w5xv+QR3eraGbBZiIGsxO9hoXu
        jrldFjxavpMjsmPvhkVelBI=
X-Google-Smtp-Source: AGHT+IE5i9kcTlfZR2H5tYKcfbjlJT+Ckal6PZYpU1eGohJyt0+C8lji4HPCyFEuAw/5DTaKt+dj2g==
X-Received: by 2002:a17:90a:348b:b0:27d:c5b:747c with SMTP id p11-20020a17090a348b00b0027d0c5b747cmr2765992pjb.2.1697048525371;
        Wed, 11 Oct 2023 11:22:05 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:298e:308c:8339:ebb8? ([2001:df0:0:200c:298e:308c:8339:ebb8])
        by smtp.gmail.com with ESMTPSA id e5-20020aa78c45000000b00692acfc4b3csm10246601pfd.136.2023.10.11.11.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 11:22:04 -0700 (PDT)
Message-ID: <12c7b0db-938c-9ca4-7861-dd703a83389a@gmail.com>
Date:   Thu, 12 Oct 2023 07:21:52 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/6] net: fec: use dma_alloc_noncoherent for m532x
Content-Language: en-US
To:     Greg Ungerer <gerg@linux-m68k.org>, Christoph Hellwig <hch@lst.de>
Cc:     Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>
References: <20231009074121.219686-1-hch@lst.de>
 <20231009074121.219686-6-hch@lst.de>
 <ea608718-8a50-4f87-aecf-fc100d283fe8@arm.com>
 <0299895c-24a5-4bd4-b7a4-dc50cc21e3d8@linux-m68k.org>
 <20231011055213.GA1131@lst.de>
 <cff2d9f0-4719-4b88-8ed5-68c8093bcebf@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <cff2d9f0-4719-4b88-8ed5-68c8093bcebf@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On 12/10/23 02:09, Greg Ungerer wrote:
>
> I think this needs to be CONFIG_COLDFIRE is set and none of 
> CONFIG_HAVE_CACHE_CB or
> CONFIG_CACHE_D or CONFIG_CACHE_BOTH are set.
>
>
>
>> in the fec driver do the alloc_noncoherent and global cache flush
>> hack if:
>>
>> COMFIG_COLDFIRE && (CONFIG_CACHE_D || CONFIG_CACHE_BOTH)
>
> And then this becomes:
>
> CONFIG_COLDFIRE && (CONFIG_HAVE_CACHE_CB || CONFIG_CACHE_D || 
> CONFIG_CACHE_BOTH)

You appear to have dropped a '!' there ...

Cheers,

     Michael



