From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH v2] m68k/defconfig: amcore board defconfig tuning
Date: Mon, 16 Jan 2017 10:00:43 +1000
Message-ID: <7b8c83cf-dd97-70a4-b643-002cfb4cccef@westnet.com.au>
References: <1484353225-15974-1-git-send-email-angelo@sysam.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out6.external.iinet.net.au ([203.59.1.106]:57220
        "EHLO icp-osb-irony-out6.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751122AbdAPABG (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Sun, 15 Jan 2017 19:01:06 -0500
In-Reply-To: <1484353225-15974-1-git-send-email-angelo@sysam.it>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Angelo Dureghello <angelo@sysam.it>, linux-m68k@vger.kernel.org

Hi Angelo,

On 14/01/17 10:20, Angelo Dureghello wrote:
> Changes to amcore board default config, as:
> - diet to reduce kernel size
> - enable sysfs gpio
> - enable CONFIG_SYN_COOKIES protection
> 
> Signed-off-by: Angelo Dureghello <angelo@sysam.it>

Thats great, thanks.
Will apply to the m68knommu git tree (for-next branch).

Regards
Greg
