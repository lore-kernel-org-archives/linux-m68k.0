Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B75CE79AB
	for <linux-m68k@archiver.kernel.org>; Wed, 20 Sep 2023 08:10:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233403AbjITIKc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 20 Sep 2023 04:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232262AbjITIKb (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 20 Sep 2023 04:10:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F74B97
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Sep 2023 01:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695197381;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wUFr8wXK8O4RymSbY1nra3xh487ahU0WWNS0q+EozOI=;
        b=cZw9MAO/FcFnZh/YiCPqOFpRj2rCyX2RsOemK+2vaLaMFb0Wu8mzwKMzLVxGm29okoWQVG
        SkEfU37DssycvC5aRN3SI6NWuDrNFSPNEOXhHo4rvzLdpsGrsgeCCmv3lxG33uval6NTvj
        G7r3dbjR0RWZqiRjE8SH/XD1CzAFelQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-aLxtse1nMm6biEu1ou2vqQ-1; Wed, 20 Sep 2023 04:09:39 -0400
X-MC-Unique: aLxtse1nMm6biEu1ou2vqQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f5df65fa35so48368575e9.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Sep 2023 01:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695197378; x=1695802178;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wUFr8wXK8O4RymSbY1nra3xh487ahU0WWNS0q+EozOI=;
        b=mxz6vnZYAbXcE7NaIwfgBZFbUzxQl03VVeXjQtQo3Luac/LWlP2l/86dEA4THUPZxE
         CgnHb4H3bykJriV8zJgMOxnX+UV51w9zz7LNVsj2oVEVbA3SKJPdKuxC6sC5aRVKYDFk
         90CzaGXPNai1ruV4rCq5ONo2ZRM4HQB1GamS4japvSKAhwZUwD/dkPTgRvqIug+JvwiR
         OeGLJ+Tr//18GxBGJDdrFSayerVCz7puQ7W+z1YsrczmkqCTbX+k3wjL0AwJT43tMRnh
         RYV1byha+iTb5o8VT7adWzKUUENACFjFkkA5YUfdbY3s88CebNN4JsYvoEmKwtfXq4Rl
         0Q0A==
X-Gm-Message-State: AOJu0YwcvnvSidwb1IrYtIZcfk7VsFQMZT+tDTGl9yPdtySRjI4UJiKU
        jUH0jNHmhS8gnbuMbvVMqY9bLKjROx6JYcUQCvjPEDxrW+4V6JSPabrJG5ob87aqPf0RexO4uyx
        9TK8vlOhfVN2Lfu1xk1MwxInX8HZx
X-Received: by 2002:a1c:771a:0:b0:401:bf56:8ba0 with SMTP id t26-20020a1c771a000000b00401bf568ba0mr1546103wmi.28.1695197378555;
        Wed, 20 Sep 2023 01:09:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHysZz6FM59YTt5tU+tK8YwrLHrBxcEDjY1ArDkjh6Nbe/7xpyZCpKNOycMqjW9MlKxyQeQmA==
X-Received: by 2002:a1c:771a:0:b0:401:bf56:8ba0 with SMTP id t26-20020a1c771a000000b00401bf568ba0mr1546080wmi.28.1695197378265;
        Wed, 20 Sep 2023 01:09:38 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id 26-20020a05600c22da00b003fedcd02e2asm1223759wmg.35.2023.09.20.01.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 01:09:38 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, arnd@arndb.de,
        deller@gmx.de
Cc:     linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 2/5] fbdev: Replace fb_pgprotect() with
 pgprot_framebuffer()
In-Reply-To: <20230912135050.17155-3-tzimmermann@suse.de>
References: <20230912135050.17155-1-tzimmermann@suse.de>
 <20230912135050.17155-3-tzimmermann@suse.de>
Date:   Wed, 20 Sep 2023 10:09:37 +0200
Message-ID: <87fs39l0zi.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Rename the fbdev mmap helper fb_pgprotect() to pgprot_framebuffer().
> The helper sets VMA page-access flags for framebuffers in device I/O
> memory.
>

I think this rename makes it more clear.

> Also clean up the helper's parameters and return value. Instead of
> the VMA instance, pass the individial parameters separately: existing
> page-access flags, the VMAs start and end addresses and the offset

But I fail to see the benefit of this part. Could you please add an
explanation about why this change is desirable ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

