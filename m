Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB53C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Jul 2022 03:40:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbiGZDkZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 25 Jul 2022 23:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbiGZDkY (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 25 Jul 2022 23:40:24 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E496554
        for <linux-m68k@vger.kernel.org>; Mon, 25 Jul 2022 20:40:22 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id 70so12188860pfx.1
        for <linux-m68k@vger.kernel.org>; Mon, 25 Jul 2022 20:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+WBv4LTd7aGLHBME8vf9d+v8kM16zKtxRYBYDecYKYo=;
        b=iLzWZ+m2Rx1WBXzgo+RoCGCBDsKpwIMSPGh39jbJOVRYEwXW7m634GOdYAyJ7aPWEY
         1jW+6oQ8EaOzJBc9QvVNYxMlPs+vyTV6LCy+q6kIdjc8n+iMvNrBAZJnCtkCwi4YG1gB
         qcL0f278Gh+Ty4JZcdJR6cFjLXHjpuGmcVX57CjrFRRmu3E1llAehnSzXg3/T5RsU4VW
         QTDEUlRvidLIK83d1HWz/EqD2RCyyFtFH+S7ZbMj2mQnM87LiJIJ8LCp5x6yv5U/twX8
         5CFt1FZ5b2NP8Zq8NKXK/rZXTIc+ezLksHdU38LPJnlzTsYOjIAUBOyFe6qgDnO+fNhz
         RB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+WBv4LTd7aGLHBME8vf9d+v8kM16zKtxRYBYDecYKYo=;
        b=oHh3Vr/obcDDIwn51roG6+Novdu9YPbCL5ssAPsFhN883zJDehEEAgbK7FDpw5FtrR
         Kt85Z/nXkMvRUcWGgJLT8UFxI8yxexL/CNFi953yyvxCmb5yIH2ktEmKPcrIMa4Fj34z
         DLxnG+wnhontiP/m0evZzG2KV6tjNcF3GsjqOtdL8Qp6vgRPv73eqVAJ1t+5juMRflmw
         wvbihC+pxf3lxt/9ZkkhBRuvPh4y7L+YvtLZjme+IE0V1Lv2A6fFDNbLa1arZQNC1/WX
         VhEsOtxbmrrv9UqFQRMKcspw+j04+Erz4+9eHXeIO7QINIH5LCKxHqeS0O0u5QFObwz7
         MtBQ==
X-Gm-Message-State: AJIora+NT1o23COnHMcslJ/kQTrbn+BEMEgwE+OvKqfBjcaL8Kr2fAXu
        CR7W4+nrByR8lwGf9jvf5mOSJQ==
X-Google-Smtp-Source: AGRyM1vGQoM73cO/4mRqmSCzSnIgSGchlsNVbhscfk9WilDdCC1VWcvK/iUN296GMh9wsNzWVKv75w==
X-Received: by 2002:a63:5b22:0:b0:41a:a605:f59a with SMTP id p34-20020a635b22000000b0041aa605f59amr13889957pgb.595.1658806821939;
        Mon, 25 Jul 2022 20:40:21 -0700 (PDT)
Received: from [192.168.1.100] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id z22-20020aa79596000000b0050dc7628183sm10628291pfj.93.2022.07.25.20.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 20:40:21 -0700 (PDT)
Message-ID: <71d9f2fe-42d1-2a09-a860-702b42a3a733@kernel.dk>
Date:   Mon, 25 Jul 2022 21:40:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7 2/2] block: add overflow checks for Amiga partition
 support
Content-Language: en-US
To:     Michael Schmitz <schmitzmic@gmail.com>,
        Martin Steigerwald <martin@lichtvoll.de>,
        linux-block@vger.kernel.org
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
References: <1539570747-19906-1-git-send-email-schmitzmic@gmail.com>
 <1539570747-19906-3-git-send-email-schmitzmic@gmail.com>
 <2265295.ElGaqSPkdT@ananda> <5e45c2a8-b35e-9a15-18e6-2e3a7ad00f5f@kernel.dk>
 <e0b99db6-ab3e-1c6d-d431-99cee32c1ced@gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <e0b99db6-ab3e-1c6d-d431-99cee32c1ced@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 7/25/22 7:53 PM, Michael Schmitz wrote:
> Hi Jens,
> 
> there's been quite a bit of review on this patch series back in the
> day (most of that would have been on linux-m68k IIRC; see Geert's
> Reviewed-By tag), and I addressed the issues raised but as you say, it
> did never get merged.
> 
> I've found a copy of the linux-block repo that has these patches, will
> see if I can get them updated to apply to current linux-block.

Thanks, please do resend them and we can get them applied.

-- 
Jens Axboe

