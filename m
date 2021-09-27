Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95067C433F5
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Sep 2021 15:07:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DAC661058
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Sep 2021 15:07:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235072AbhI0PIs (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Sep 2021 11:08:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40885 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235071AbhI0PIr (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Sep 2021 11:08:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632755229;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H2YLjPWLjDxhksfVJJ0b+TgzS3sQ4uenpZKkXE6cLl8=;
        b=CI15DFoi3XIG0fxC6HpZG6pyA5oOq6qQXCz1annlYGBip6XeSk3NzkehCeJlkzIkUi9HGp
        JDcV5pFdkBEuUcerEwDz3JZ5DoIiqTJVuoHHYcaxm44gG0wNw9H+alFQ/KH92Dy02qiHGf
        hH+5RU37+2Zm/nE7Bm8V1SMkSENNy4U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-g2LKAcE0O9CMMsj_dsQ-Og-1; Mon, 27 Sep 2021 11:07:06 -0400
X-MC-Unique: g2LKAcE0O9CMMsj_dsQ-Og-1
Received: by mail-wr1-f69.google.com with SMTP id s13-20020adfeccd000000b00160531902f4so6537544wro.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Sep 2021 08:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=H2YLjPWLjDxhksfVJJ0b+TgzS3sQ4uenpZKkXE6cLl8=;
        b=bLbOgnduF+KwOOHc94H9I9MglnNpJj3zXV/5jaRGHE0ms69/qa0an++m2HF79sJY9A
         b4VxAkbFZvAQ1IhFji83T88SKgQZOllgv1LWdNU3Y93nqGPLe/8PAtZQUmzHGG/Gzfxp
         PCrczlr0nYuBcw28hkE9EADHvRdfX8RK+raSsWRtOeyZN83gmrwXE0JSNo+3GeurIXQt
         +B7wm8HGn4U5K2rosUEMiZ9hJW9JD7DQ3ISql2DlXhZN8UBe9Ir3WQuuNCGxQIonrhI2
         bxLbmXqFsk26JFX2jmhAxjr/07OOhmTAD45jRcDp9cZvPcQo7n+QM76XIiDJjrcVhn9T
         y0YQ==
X-Gm-Message-State: AOAM531Vfk5vYd+HLBVZk+CQj9ip9T7oCEtmOyk449iWDDIKMSqIYIFt
        oVr3xiaOc6AdK9u3r7O7FNd49Owg1FyYENXQF97Tfbh5Ab4bV+9brjfsn/XuSAwSphpeYPoaeW2
        2kEsY3lqkkfoP541Fm3fiBfndkl70
X-Received: by 2002:a5d:590a:: with SMTP id v10mr361567wrd.87.1632755224888;
        Mon, 27 Sep 2021 08:07:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy5wlKXLyU5BWf9WD/reu/rSzNLdsCLGLJ2WCZuEX7Xkvd9O/Z0HH1Erkz7+dZr/KU55FrDA==
X-Received: by 2002:a5d:590a:: with SMTP id v10mr361519wrd.87.1632755224672;
        Mon, 27 Sep 2021 08:07:04 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c654d.dip0.t-ipconnect.de. [91.12.101.77])
        by smtp.gmail.com with ESMTPSA id f9sm284908wmf.3.2021.09.27.08.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 08:07:04 -0700 (PDT)
Subject: Re: [PATCH v1 0/4] mm/memory_hotplug: full support for
To:     linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Jianyong Wu <Jianyong.Wu@arm.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-snps-arc@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-mm@kvack.org,
        kexec@lists.infradead.org
References: <20210927150518.8607-1-david@redhat.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <d7d4ec92-7b9c-f466-6d3c-cfdd162d1dbf@redhat.com>
Date:   Mon, 27 Sep 2021 17:07:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210927150518.8607-1-david@redhat.com>
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

Intended subject was "[PATCH v1 0/4] mm/memory_hotplug: full support for 
add_memory_driver_managed() with CONFIG_ARCH_KEEP_MEMBLOCK"

-- 
Thanks,

David / dhildenb

