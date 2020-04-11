Return-Path: <SRS0=6pxz=53=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9070BC2D0EC
	for <linux-m68k@archiver.kernel.org>; Sat, 11 Apr 2020 00:45:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E7BC20787
	for <linux-m68k@archiver.kernel.org>; Sat, 11 Apr 2020 00:45:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=landley-net.20150623.gappssmtp.com header.i=@landley-net.20150623.gappssmtp.com header.b="GKV9+eEK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgDKApH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 10 Apr 2020 20:45:07 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:37078 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbgDKApH (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 10 Apr 2020 20:45:07 -0400
Received: by mail-oi1-f182.google.com with SMTP id u20so2784412oic.4
        for <linux-m68k@vger.kernel.org>; Fri, 10 Apr 2020 17:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=9NTj+9RJ8go1IrEaz/7RJtlbGnU3Z6YHkUpffCG/6v4=;
        b=GKV9+eEKdgqX7rlsrtEd7VvFiKGrkrMtf6jp+JSRdGtxHQP/XSGHpNgWZDgRFCrh5J
         3k6UT9WOpykQ+AxBs0Sr8xG6oXx8lWMlaakP9UjkgidHyo03lkukgNDwht+XxDCzV7FR
         9HfGkhwObQtzNSPwZAbtc0m8++aVBGcNOfhxsd4YJJJAffxCVviuz4r8MkwyW6AlOWCm
         35/oeNjfVqUizxNzwhnKNeniSB9dwtZ+D/tPsq/w5Cncdgtv21n02+wmCd154Sj0d7HA
         g04zL9jQ6Odgdy6dD1248ia59h3mTZh2AsphSj6SzJWtalpwBwJjPhF2Zc3HUkX6d9MQ
         3H+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=9NTj+9RJ8go1IrEaz/7RJtlbGnU3Z6YHkUpffCG/6v4=;
        b=alM56cKX4J2d064SvfwlOAdCp8Vcle5bcBgls8F0pmTNS56agq9JQXTqDkvHajLV/N
         FFdZDNwaiohk9nPd9D8DfMuyzn+AwHLYQn+zMeBMoT8DnCOCskg5I9mHI5ObIIn3hmaD
         C7dA1lTL/fqgREMtQ4W2oA6Caffy044H6sZyWhRYJsYwLx1GszilJU8DH+HscBrUPiho
         jSEmyYphTNkdZFBKJorocc0iI/xAeyuKeLFIMP3p5p6W8bXU/F+wuJ3VC8vSXy1/hc1U
         J2uIH4X6h4aJ4j8zvetY5TsJZvE+Yu0W6XedQ4LWR5lZ8a/vEFFWwoSwfSiKru0iOciR
         C1sg==
X-Gm-Message-State: AGi0PubrCrbCNcrmp2QMCg5ICztHPWcbNEl0uY1cuZI8m2aKM5nZO/+O
        cVK3eVascbFzB2IhVip+JkVL0uHc5nA=
X-Google-Smtp-Source: APiQypLZjZmG1hLpK1+h1YCfBO1lD8Nw1LMnd0X6d/Iy1CSskVAIev7gEfkiBrWRz4mlheZsGSAi/w==
X-Received: by 2002:aca:e189:: with SMTP id y131mr3475806oig.98.1586565906658;
        Fri, 10 Apr 2020 17:45:06 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.googlemail.com with ESMTPSA id t11sm2289588oov.1.2020.04.10.17.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 17:45:05 -0700 (PDT)
To:     linux-m68k@vger.kernel.org, Laurent Vivier <Laurent@Vivier.EU>
From:   Rob Landley <rob@landley.net>
Subject: Running m68k on qemu with external initramfs?
Message-ID: <b1e930f3-7775-6955-860e-a2886627caa8@landley.net>
Date:   Fri, 10 Apr 2020 19:50:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

I'm adding m68k support to toybox's "make root" target and I have a kernel and a
rootfs.cpio.gz, but qemu's -initrd option doesn't put the rootfs image somewhere
the m68k kernel can find it.

Is this a "modify qemu" problem or a "modify kernel" problem?

Rob
