From: Steven King <sfking@fdwdc.com>
Subject: [PATCH] Coldfire GPIO corrections
Date: Thu, 15 Oct 2009 12:54:41 -0700
Message-ID: <200910151254.41599.sfking@fdwdc.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_B431KZsrqVNC2i7"
Return-path: <uclinux-dev-bounces@uclinux.org>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: uclinux-dev@uclinux.org
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

--Boundary-00=_B431KZsrqVNC2i7
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Pin 0 of the EPORT is not connected on the 523x, 5271, 5275 and 528x and the 
TIMER on the 523x has 8 pins, not 4.
-- 
Steven King -- sfking at fdwdc dot com

Signed-off-by: Steven King <sfking@fdwdc.com>

diff --git a/arch/m68knommu/platform/523x/gpio.c b/arch/m68knommu/platform/523x/gpio.c
index f02840d..a8842dc 100644
--- a/arch/m68knommu/platform/523x/gpio.c
+++ b/arch/m68knommu/platform/523x/gpio.c
@@ -30,7 +30,8 @@ static struct mcf_gpio_chip mcf_gpio_chips[] = {
 			.direction_output	= mcf_gpio_direction_output,
 			.get			= mcf_gpio_get_value,
 			.set			= mcf_gpio_set_value,
-			.ngpio			= 8,
+			.base			= 1,
+			.ngpio			= 7,
 		},
 		.pddr				= MCFEPORT_EPDDR,
 		.podr				= MCFEPORT_EPDR,
@@ -244,7 +245,7 @@ static struct mcf_gpio_chip mcf_gpio_chips[] = {
 			.get			= mcf_gpio_get_value,
 			.set			= mcf_gpio_set_value_fast,
 			.base			= 96,
-			.ngpio			= 4,
+			.ngpio			= 8,
 		},
 		.pddr				= MCFGPIO_PDDR_TIMER,
 		.podr				= MCFGPIO_PODR_TIMER,
diff --git a/arch/m68knommu/platform/527x/gpio.c b/arch/m68knommu/platform/527x/gpio.c
index 1028142..0b56e19 100644
--- a/arch/m68knommu/platform/527x/gpio.c
+++ b/arch/m68knommu/platform/527x/gpio.c
@@ -31,7 +31,8 @@ static struct mcf_gpio_chip mcf_gpio_chips[] = {
 			.direction_output	= mcf_gpio_direction_output,
 			.get			= mcf_gpio_get_value,
 			.set			= mcf_gpio_set_value,
-			.ngpio			= 8,
+			.base			= 1,
+			.ngpio			= 7,
 		},
 		.pddr				= MCFEPORT_EPDDR,
 		.podr				= MCFEPORT_EPDR,
@@ -263,7 +264,8 @@ static struct mcf_gpio_chip mcf_gpio_chips[] = {
 			.direction_output	= mcf_gpio_direction_output,
 			.get			= mcf_gpio_get_value,
 			.set			= mcf_gpio_set_value,
-			.ngpio			= 8,
+			.base			= 1,
+			.ngpio			= 7,
 		},
 		.pddr				= MCFEPORT_EPDDR,
 		.podr				= MCFEPORT_EPDR,
diff --git a/arch/m68knommu/platform/528x/gpio.c b/arch/m68knommu/platform/528x/gpio.c
index ec59395..eedaf0a 100644
--- a/arch/m68knommu/platform/528x/gpio.c
+++ b/arch/m68knommu/platform/528x/gpio.c
@@ -31,7 +31,7 @@ static struct mcf_gpio_chip mcf_gpio_chips[] = {
 			.get			= mcf_gpio_get_value,
 			.set			= mcf_gpio_set_value,
 			.base			= 1,
-			.ngpio			= 8,
+			.ngpio			= 7,
 		},
 		.pddr				= MCFEPORT_EPDDR,
 		.podr				= MCFEPORT_EPDR,

--Boundary-00=_B431KZsrqVNC2i7
Content-Type: text/x-diff;
  charset="iso 8859-15";
  name="foo"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="foo"

Signed-off-by: Steven King <sfking@fdwdc.com>

diff --git a/arch/m68knommu/platform/523x/gpio.c b/arch/m68knommu/platform/523x/gpio.c
index f02840d..a8842dc 100644
--- a/arch/m68knommu/platform/523x/gpio.c
+++ b/arch/m68knommu/platform/523x/gpio.c
@@ -30,7 +30,8 @@ static struct mcf_gpio_chip mcf_gpio_chips[] = {
 			.direction_output	= mcf_gpio_direction_output,
 			.get			= mcf_gpio_get_value,
 			.set			= mcf_gpio_set_value,
-			.ngpio			= 8,
+			.base			= 1,
+			.ngpio			= 7,
 		},
 		.pddr				= MCFEPORT_EPDDR,
 		.podr				= MCFEPORT_EPDR,
@@ -244,7 +245,7 @@ static struct mcf_gpio_chip mcf_gpio_chips[] = {
 			.get			= mcf_gpio_get_value,
 			.set			= mcf_gpio_set_value_fast,
 			.base			= 96,
-			.ngpio			= 4,
+			.ngpio			= 8,
 		},
 		.pddr				= MCFGPIO_PDDR_TIMER,
 		.podr				= MCFGPIO_PODR_TIMER,
diff --git a/arch/m68knommu/platform/527x/gpio.c b/arch/m68knommu/platform/527x/gpio.c
index 1028142..0b56e19 100644
--- a/arch/m68knommu/platform/527x/gpio.c
+++ b/arch/m68knommu/platform/527x/gpio.c
@@ -31,7 +31,8 @@ static struct mcf_gpio_chip mcf_gpio_chips[] = {
 			.direction_output	= mcf_gpio_direction_output,
 			.get			= mcf_gpio_get_value,
 			.set			= mcf_gpio_set_value,
-			.ngpio			= 8,
+			.base			= 1,
+			.ngpio			= 7,
 		},
 		.pddr				= MCFEPORT_EPDDR,
 		.podr				= MCFEPORT_EPDR,
@@ -263,7 +264,8 @@ static struct mcf_gpio_chip mcf_gpio_chips[] = {
 			.direction_output	= mcf_gpio_direction_output,
 			.get			= mcf_gpio_get_value,
 			.set			= mcf_gpio_set_value,
-			.ngpio			= 8,
+			.base			= 1,
+			.ngpio			= 7,
 		},
 		.pddr				= MCFEPORT_EPDDR,
 		.podr				= MCFEPORT_EPDR,
diff --git a/arch/m68knommu/platform/528x/gpio.c b/arch/m68knommu/platform/528x/gpio.c
index ec59395..eedaf0a 100644
--- a/arch/m68knommu/platform/528x/gpio.c
+++ b/arch/m68knommu/platform/528x/gpio.c
@@ -31,7 +31,7 @@ static struct mcf_gpio_chip mcf_gpio_chips[] = {
 			.get			= mcf_gpio_get_value,
 			.set			= mcf_gpio_set_value,
 			.base			= 1,
-			.ngpio			= 8,
+			.ngpio			= 7,
 		},
 		.pddr				= MCFEPORT_EPDDR,
 		.podr				= MCFEPORT_EPDR,

--Boundary-00=_B431KZsrqVNC2i7
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
--Boundary-00=_B431KZsrqVNC2i7--
