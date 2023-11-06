Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E374FC4332F
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Nov 2023 14:20:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbjKFOUM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Nov 2023 09:20:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjKFOUL (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 6 Nov 2023 09:20:11 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 903BEB8
        for <linux-m68k@vger.kernel.org>; Mon,  6 Nov 2023 06:20:09 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17EC2C433C8;
        Mon,  6 Nov 2023 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1699280409;
        bh=hyB5Pd+p3acivlneWASXi+oJWgrjwoStocx8tiGQWh8=;
        h=Date:From:To:Subject:From;
        b=Ldtm5+txCXeksR9YgBmOTNA4XmaAntmmZlS5Mx+wAeOfb4/z6OGmL8rttc0UEg9lg
         DsA3t7kH2EwYffrIFXcPPUeIJjmdIvK30XotmYHH0uwYkpbSVet9ar+hvWCgK7tmbB
         oA+MwXYi+0WBSGYIJLR8vn0/TqgI7Qy+Sn1ydvq8=
Date:   Mon, 6 Nov 2023 09:20:08 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     linux-m68k@vger.kernel.org
Subject: PSA: migrating linux-m68k to new vger infrastructure
Message-ID: <20231106-nickel-ringtail-of-will-b7fc7a@nitro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Good day!

I plan to migrate the linux-m68k@vger.kernel.org list to the new
infrastructure this week. We're still doing it list-by-list to make sure that
we don't run into scaling issues with the new infra.

The migration will be performed live and should not require any downtime.
There will be no changes to how anyone interacts with the list after
migration is completed, so no action is required on anyone's part.

Please let me know if you have any concerns.

Best wishes,
-K
