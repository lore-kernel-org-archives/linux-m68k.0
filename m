From: <gerg@snapgear.com>
Subject: [PATCH 0/2] m68knommu: fix cpu optimization conditionals
Date: Fri, 3 Jun 2011 16:43:14 +1000
Message-ID: <1307083397-9994-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:10978 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751256Ab1FCGmx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Jun 2011 02:42:53 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


The next 2 patches improve the conditional checks for portions of cpu
optimized code. Older versions of gcc compiler can incorrectly define
CPU symbols. By using our own local CPU family defines we can also
make the optimizations safe in case of a kernel being compiled for
multiple CPU targets.

These are generated agains linux-3.0.0-rc1.
