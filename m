Return-Path: <SRS0=2kwO=74=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE56C433DF
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 16:55:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2546620663
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 16:55:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMBHqODT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729772AbgFOQzs (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 Jun 2020 12:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729628AbgFOQzr (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 15 Jun 2020 12:55:47 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FBE6C061A0E
        for <linux-m68k@vger.kernel.org>; Mon, 15 Jun 2020 09:55:47 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id y13so18221216eju.2
        for <linux-m68k@vger.kernel.org>; Mon, 15 Jun 2020 09:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sbM1iepNOY3Wr2Ye+m+8S5L+ZkV2zONAnJwMRHsXaFU=;
        b=QMBHqODTvwdlvMaL4Wn2aKXNIR2f67jjxzefipRGl8i9MCZj0hJ+XV9ReKKaJ8YLF2
         7v7bmztIR62Au1ZrVqYh8IoSSw2ploxtjUr0NGrFN7v4v9c/zTlGLrGzVQizUPwHPlUS
         4L9bkOpeTiG2gfweg9e7k0oJBiCLbs63KOVpOtFG3lfmtwM7cLeOzB9cOzInUb3JlfW6
         AqL2FWL850y1bddp+LYCdl5DafpJp/btm5hAuy5MIjQke2+y7OyWqQXFTBPtwgz3JDmS
         ZLveMiBLjB7U71BS41uU7ADApDGPsYVrowAE8J2zZawB3fXDEmzxk/XtlszAn2sK4ugj
         6HWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sbM1iepNOY3Wr2Ye+m+8S5L+ZkV2zONAnJwMRHsXaFU=;
        b=bfihnbQaTx7w0NUptYJu8W2Dh8nendfyJsuJMHmq6kRUSaDFymDwasdCsdzbA7hMJA
         r0kXZX0KeCGW1r9C7VuBwA8+sVOPjRTxtu9viZaojyEU73ddxFd419A3FI4BbxkVpn4/
         bH1er0TKQYJN6m6XiqRkULgXu7AN+oA/XC1sub65Ua9+pyfDApf+IhhEKKp8vofMXv4R
         0fQGqlakgBFHXyXnfXYJJdNqQGersq3YlQoH9noIpO0GDBccoNLJTzaLpD2Fh5Awrrol
         2l9FY2/opZneDTQ7GYp/YvAhFIyFtQOKQ/qBuWso2oIkRTNNZRb08KA3VZ2MTd4gFy/g
         yvXg==
X-Gm-Message-State: AOAM53069UTioTrJRkEzKqQs2N7ZvUCJ8Hb+5VxYYy6oE1aCAhtRigs/
        YzWZ223sy5AsV5NBp/VEZvA=
X-Google-Smtp-Source: ABdhPJxzxiUOAwVdcHL3xIvrEjo9nxzJyOvnWY2LS2dpQyeU1TqUWduhKwAibRRCCesotSuc8YGbTw==
X-Received: by 2002:a17:906:48d8:: with SMTP id d24mr26104154ejt.369.1592240145900;
        Mon, 15 Jun 2020 09:55:45 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:2438:c4f9:4ba4:a33e])
        by smtp.gmail.com with ESMTPSA id v26sm9243627ejx.25.2020.06.15.09.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 09:55:45 -0700 (PDT)
Date:   Mon, 15 Jun 2020 18:55:44 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH 5/5] m68knommu: fix use of cpu_to_le() on IO access
Message-ID: <20200615165544.pndzr6ne77ns6dyo@ltop.local>
References: <20200615071636.2598894-1-gerg@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615071636.2598894-1-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jun 15, 2020 at 05:16:36PM +1000, Greg Ungerer wrote:
> Due to the different data endian requirements of different buses on
> m68knommu variants we sometimes need to byte swap results for readX()
> or values to writeX(). Currently the code uses cpu_to_le to do this,
> resulting in sparse warnings like:
> 
> arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
> 
> Some casting to force __le32 types would resolve but it looks to be
> simpler to just switch to using the underlying swab32() to resolve.

Yes indeed, since the raw accessors are supposed to be native-endian, doing:
	native -> force cast to le32 -> le32_to_cpu() 
doesn't seem to have any advantages over the swab32().

Feel free to add my:
Reviewed-y: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

-- Luc
