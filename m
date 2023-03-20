Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EC2C6FD1C
	for <linux-m68k@archiver.kernel.org>; Mon, 20 Mar 2023 19:09:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbjCTTI6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 20 Mar 2023 15:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231379AbjCTTIe (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 20 Mar 2023 15:08:34 -0400
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B9944BEB4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Mar 2023 12:00:47 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id b20so17861462edd.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Mar 2023 12:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679338801; x=1681930801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8YlfMACqhZY+YRomG4PdoSrNzR3WpyqjeQM5DwdiTkk=;
        b=qq3caPcLwlJT4/e+1H9v9Y2IdH9Qj9EgefaRXJgz7uJ7TfOFnn3nokiSJ6sNVI6Y6J
         zcW9ptBj+M8Sn8a1nF7ufajeKQw1kfodaYU0XIxRkbkgO7tgIF+aAlyHzwb1gyKAPa+v
         LTCVvrFzLIvmqPXjz9AQAmv9SV7TRoyMgwmxall3SFP2nUUuUv/eKDRT+nSKHO9Hcqq3
         8Kcv0T9fORlcSMHsBkKAmijjjXP/LAPILSS9cIEf7JbI/Dlj9sPFmml/uGpIp0orEv5Q
         Lf8HXijHoagQ4NQj73W1v4OS4vtjd8GRAtkCFDKTHU7dy2nU7LFEfYIIHZj9E8P0OS6W
         7vEg==
X-Gm-Message-State: AO0yUKX5TPELWL/5dqT1xh8CACnJ/nj3mjL28nztBsKc2ihQrgsAOtav
        G+hgsbQ1/HVZoOUaQOh9n6E=
X-Google-Smtp-Source: AK7set+NPiSXzfehtzkdVf58PBGF7iCyR1T7R3huqkZnQFlyAGakrHL1ORkdSn3uvm8uNHJHWDuajQ==
X-Received: by 2002:a17:906:dd:b0:92f:27c2:13a3 with SMTP id 29-20020a17090600dd00b0092f27c213a3mr105004eji.3.1679338800719;
        Mon, 20 Mar 2023 12:00:00 -0700 (PDT)
Received: from [10.100.102.14] (85.65.253.165.dynamic.barak-online.net. [85.65.253.165])
        by smtp.gmail.com with ESMTPSA id n15-20020a170906118f00b0092421bf4927sm4840150eja.95.2023.03.20.11.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 12:00:00 -0700 (PDT)
Message-ID: <725cc2a7-8a3d-6d23-c9b2-c841e9d14201@grimberg.me>
Date:   Mon, 20 Mar 2023 20:59:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] nvme-tcp: fix nvme_tcp_term_pdu to match spec
Content-Language: en-US
To:     Caleb Sander <csander@purestorage.com>,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-nvme@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <linux-m68k@lists.linux-m68k.org>
 <20230320155736.1492682-1-csander@purestorage.com>
From:   Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20230320155736.1492682-1-csander@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Thanks for fixing this,

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
