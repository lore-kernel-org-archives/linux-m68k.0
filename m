Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1452EC4332F
	for <linux-m68k@archiver.kernel.org>; Wed, 29 Sep 2021 16:30:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF4F261452
	for <linux-m68k@archiver.kernel.org>; Wed, 29 Sep 2021 16:30:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345805AbhI2Qb4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 29 Sep 2021 12:31:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32760 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345849AbhI2Qb4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 29 Sep 2021 12:31:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632933014;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LzEA/AMsDC+zBVogDRmix14O9ZRH28vVpD1t8BFMOTQ=;
        b=OHBmXcXFal572r+La62x/Pn62V3aPieYOB7wpdnX+fdQtLC0NoStUv+jiupRblcNaL3ueG
        KAyzB/qmCFYPkPzJ99/RNGLkOgQmgI6ENjA0Hl59ZGewjTj0IjWYZ6sXmWRuGDsqkZZI1A
        WaMksgp254vi7iOLDxJkYraotUwtBZw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-Kn-ehLQZMdmcrOTQpd_xaA-1; Wed, 29 Sep 2021 12:30:12 -0400
X-MC-Unique: Kn-ehLQZMdmcrOTQpd_xaA-1
Received: by mail-wm1-f72.google.com with SMTP id d12-20020a1c730c000000b0030b4e0ecf5dso1031102wmb.9
        for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Sep 2021 09:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=LzEA/AMsDC+zBVogDRmix14O9ZRH28vVpD1t8BFMOTQ=;
        b=j1bW0RRx8Fhd2iqScuS6ugK1M85rcf+cACLXxUTZdXokKLaHfkZUZXpHimYGr+eUQj
         Y+jxu4KVZzR90ilDjhRrfZDcalG+zaRFR5khBR2x6av2PGJnOARjZCs2eu2VN5z13fRB
         HBUtXETOtXq8bMXKaiX1QglNrpdaZDiy7eCEYGz3UbaZv/ZZCFn/J3o/3D0WA6a69CPH
         ppA5ImouBkX8RcfdS9LUUeQLCQUIekUoUPo1jMeofa8KWuAmDnn3QhlN72Z/mH236h0d
         1BK5XkzdeB/9CTD2hONdEpRBGhP7d3idtFa5hpYiOXxyolAU8uZYRK5C+5q5HJDXy+Td
         q+VA==
X-Gm-Message-State: AOAM5313qoXt0GFO5O4uAh+J5IRlAw0mWSaO1wA+Kf/jco00lMa7fqiV
        I+Kh6860US1s7yTOcwCg1QLPbnjlmX+F+qpcazv/eGhJN7O4OBhwlM6m+j4m3W2Ku0qilxfna1g
        tXrRUf+skTAg+LTw8G6J85tGrWHEi
X-Received: by 2002:a05:6000:184c:: with SMTP id c12mr1026276wri.150.1632933011655;
        Wed, 29 Sep 2021 09:30:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWpbhPpbSmBcJNqivlDLJZ/UTUefLQTk4gKa/CcEn6HHHOoDfx1bOgZbQtRoI/dHj6OAlJWg==
X-Received: by 2002:a05:6000:184c:: with SMTP id c12mr1026220wri.150.1632933011388;
        Wed, 29 Sep 2021 09:30:11 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c3b.dip0.t-ipconnect.de. [79.242.60.59])
        by smtp.gmail.com with ESMTPSA id m21sm354405wmq.37.2021.09.29.09.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 09:30:10 -0700 (PDT)
Subject: Re: [PATCH v1 2/4] memblock: allow to specify flags with
 memblock_add_node()
To:     Mike Rapoport <rppt@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
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
 <20210927150518.8607-3-david@redhat.com> <YVSTkGdh2nQWQp+U@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <3651c7d0-f7b6-63ff-216a-b74176623a6f@redhat.com>
Date:   Wed, 29 Sep 2021 18:30:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YVSTkGdh2nQWQp+U@kernel.org>
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

On 29.09.21 18:25, Mike Rapoport wrote:
> On Mon, Sep 27, 2021 at 05:05:16PM +0200, David Hildenbrand wrote:
>> We want to specify flags when hotplugging memory. Let's prepare to pass
>> flags to memblock_add_node() by adjusting all existing users.
>>
>> Note that when hotplugging memory the system is already up and running
>> and we don't want to add the memory first and apply flags later: it
>> should happen within one memblock call.
> 
> Why is it important that the system is up and why it should happen in a
> single call?
> I don't mind adding flags parameter to memblock_add_node() but this
> changelog does not really explain the reasons to do it.

"After memblock_add_node(), we could race with anybody performing a 
search for MEMBLOCK_NONE, like kexec_file -- and that only happens once 
the system is already up and running. So we want both steps to happen 
atomically."

I can add that to the patch description.

(I think it still won't be completely atomic because memblock isn't 
properly implementing locking yet, but that's a different story)

-- 
Thanks,

David / dhildenb

