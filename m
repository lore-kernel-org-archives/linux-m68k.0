Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF6BC54EBD
	for <linux-m68k@archiver.kernel.org>; Thu, 12 Jan 2023 06:43:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbjALGnG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 12 Jan 2023 01:43:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbjALGnF (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 12 Jan 2023 01:43:05 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C29AF4A960
        for <linux-m68k@vger.kernel.org>; Wed, 11 Jan 2023 22:43:04 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id w3so19288260ply.3
        for <linux-m68k@vger.kernel.org>; Wed, 11 Jan 2023 22:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egVYWGP00U6k5Eyx54nkCztOPy/6859mnB4n9FHPSzE=;
        b=OTXbCKtqHXDOKkKtVrMmqZKgdFQ+92vzUDVfrl/YaXmxhLkT3MQ4sIYqZPvqjFLr8O
         DyuuV0QaDD1TKnBC6reZW640IVL5fkDcWBsnSJ2XV+wTFFaJ4W8SIF5BHrd7aeJmwEw4
         mLQJ/TmvOBVrvIQzZQqCNlNuVkj6rV5bNi5Sy/bLbhYqLkoj+nDI0khtoCeLd9UQYtGm
         ji+Y0FMx6UKS1woejQ64fg0OvZiF/pFGZfYG4I6zBJxboEBD5Z2IeWakRnuP9kvmn0cR
         aCJtC8ZefGy6x/Kqi3NHW+/t8dkEnQ80oG06viHZA8l2aiAPq9iPp2twyl1DL5Fqtj3q
         fz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=egVYWGP00U6k5Eyx54nkCztOPy/6859mnB4n9FHPSzE=;
        b=QWRBrfbIjghHAjfzg6gKpzXe/HL0Uzqf4eFp7jdS3Imnx2NCBretQfAuMB8DIwoejJ
         /SaGPTOpOyr05cwC06U6TrU/2xWH09Fi8tnGDBl+DBvo60CyPLxH2NxrwcQQ89OhEiil
         F9KeemBzbmykEwVTkAQvsjS+TH6CMgbstlp9nFX7WUo4GJBUz38E71DnCcQGTx67yExE
         SiMsvn0yOYSaONR2DGrkhdNrSUxJoJLslnpMcyiOGhSFa9ycFj0RUWc1VzRGYVK8yNv4
         QL6Y9cpuN0+T+dJPOpwt2+CkL0lmPI60m2xII9A2Sk+cdywvb6kXTfxoL2BfyCg2p+wC
         6pHQ==
X-Gm-Message-State: AFqh2krsmPIZ5R8pypXKAuh7hTkj9YZqgBtARzf1gaBQS9i2Ug0T+qjq
        4LWl7j1hO9X+0Mxidpb4NAc=
X-Google-Smtp-Source: AMrXdXtqE+5JcNTaKhPiqeO/c48AyerkhYeuVXynZOZS+U4NBZqDwkPDKyuC+HXwbrMdK+YohoMp9w==
X-Received: by 2002:a17:90a:7788:b0:226:f2a0:8723 with SMTP id v8-20020a17090a778800b00226f2a08723mr17212588pjk.42.1673505784233;
        Wed, 11 Jan 2023 22:43:04 -0800 (PST)
Received: from [10.1.1.24] (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id q3-20020a17090a2e0300b0020ae09e9724sm9825954pjd.53.2023.01.11.22.43.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Jan 2023 22:43:03 -0800 (PST)
Subject: Re: [PATCH v13 0/3] Add kernel seccomp support for m68k
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
References: <20230112035529.13521-1-schmitzmic@gmail.com>
Cc:     glaubitz@physik.fu-berlin.de
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <12f1bcf5-b401-673e-1730-38ec706c1cb6@gmail.com>
Date:   Thu, 12 Jan 2023 19:42:58 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20230112035529.13521-1-schmitzmic@gmail.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Minor correction - it's 81 tests that succeed. Most of the improvement 
due to changes to patch 3. Correcting patch 1 only added two more.

The remainder may well be due to my use of an old m68k cross tool chain 
and old ARAnyM userland. Building the self test against a current system 
version is certainly recommended, Adrian!

Cheers,

	Michael


Am 12.01.2023 um 16:55 schrieb Michael Schmitz:
> Previous version of patch 1 did overwrite a syscall return
> value that was changed by ptrace or seccomp (in regs->d0)
> by -ENOSYS when skipping a syscall. Branch directly to
> ret_from_syscall instead of falling through to badsys (which
> must set -ENOSYS). I'm sure this can be done more elegantly.
>
> Patch 3 used the wrong struct definition for ARCH_REGS - the
> kernel ptrace code copies 19 registers (from syscall stack
> and switch_stack, pt_regs only contains the 14 from the
> syscall stack). Stack overflow ensues.
>
> With these changes, 79 of 94 seccomp_bpf tests now succeed.
>
> Cheers,
>
>    Michael
>
>
